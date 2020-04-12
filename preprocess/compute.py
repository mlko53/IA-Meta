import json
import numpy as np
import pandas as pd
import warnings

import config
from constants import *

def compute_ipsatized(df, verbose=False):
    """Computes ipatized AVI scores"""

    raw_actuals = []
    raw_ideals = []
    for col in list(df):
        if col[:2] == "r." and col[-4:] == ".raw":
            raw_actuals.append(col)
        elif col[:2] == "i." and col[-4:] == ".raw":
            raw_ideals.append(col)

    if verbose:
        if len(raw_actuals) != len(raw_ideals):
            print("    WARNING: actual and ideal length don't match.")
        print("    Detected {} actual emotion words.".format(len(raw_actuals)))
        print("    Detected {} ideal emotion words.".format(len(raw_ideals)))

    actuals = df[raw_actuals].values
    ideals = df[raw_ideals].values
    actuals = actuals.astype(float)
    ideals = ideals.astype(float)

    with warnings.catch_warnings():
        warnings.simplefilter("ignore", category=RuntimeWarning)
        # ddof = 1 to compute sample standard deviation
        actuals_mean = np.nanmean(actuals, axis=1, keepdims=True)
        actuals_sd = np.nanstd(actuals, axis=1, keepdims=True, ddof=1)
        ideals_mean = np.nanmean(ideals, axis=1, keepdims=True)
        ideals_sd = np.nanstd(ideals, axis=1, keepdims=True, ddof=1)

    if verbose:
        actual_no_vary = (actuals_sd == 0).sum()
        ideal_no_vary = (ideals_sd == 0).sum()
        if actual_no_vary:
            print("    WARNING: {} did not vary actual affect".format(actual_no_vary))
        if ideal_no_vary:
            print("    Warning: {} did not vary ideal affect".format(ideal_no_vary))

    with np.errstate(divide='ignore', invalid='ignore'):
        ipsatized_actuals = (actuals - actuals_mean) / actuals_sd
        ipsatized_ideals = (ideals - ideals_mean) / ideals_sd

    ipsatized_actuals = pd.DataFrame(ipsatized_actuals,
                                     columns = [col.replace(".raw", ".ips.us") for col in raw_actuals])
    ipsatized_ideals = pd.DataFrame(ipsatized_ideals,
                                    columns = [col.replace(".raw", ".ips.us") for col in raw_ideals])

    df = df.join(ipsatized_actuals).join(ipsatized_ideals)

    return df


def compute_affective_states(df, verbose=False):
    """Computes affective states"""

    if verbose:
        print("Aggregating emotion words to affective states.")
        print("----------------------------------------------")

    with open(AFFECTIVE_STATES_DIR) as f:
        affective_states = json.load(f)

    with open(AVI_ABBREVIATION_DIR) as f:
        AVI_abbreviation_dict = json.load(f)

    affect_types = ['real', 'ideal']
    compute_types = ['raw', 'ipsatized']

    for affect in affect_types:
        for compute in compute_types:
            for state, items in affective_states.items():
                items = [AVI_abbreviation_dict[item] for item in items]
                items = ['.'.join([affect[0], item, compute[:3]]) \
                                                      for item in items]
                if compute == "ipsatized":
                    items = ['.'.join([item, "us"]) for item in items]
                col = '.'.join([affect[0], state, compute[:3], "us"])

                if verbose:
                    print("    Computing {}".format(col))

                with np.errstate(divide='ignore', invalid='ignore'):
                    df[col] = np.nanmean(df[items].values.astype(float), axis=1)

    return df

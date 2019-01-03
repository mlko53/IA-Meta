import numpy as np
import pandas as pd


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
        print("    Detected {} emotion words.".format(len(raw_actuals)))

    actuals = df[raw_actuals].values
    ideals = df[raw_ideals].values

    actuals_mean = actuals.mean(axis=1, keepdims=True)
    actuals_sd = actuals.std(axis=1, keepdims=True)
    ideals_mean = ideals.mean(axis=1, keepdims=True)
    ideals_sd = ideals.std(axis=1, keepdims=True)

    ipsatized_actuals = (actuals - actuals_mean) / actuals_sd
    ipsatized_ideals = (ideals - ideals_mean) / ideals_sd

    ipsatized_actuals = pd.DataFrame(ipsatized_actuals,
                                     columns = [col.replace(".raw", ".ips.us") for col in raw_actuals])
    ipsatized_ideals = pd.DataFrame(ipsatized_ideals,
                                    columns = [col.replace(".raw", ".ips.us") for col in raw_ideals])

    df = df.join(ipsatized_actuals).join(ipsatized_ideals)

    return df

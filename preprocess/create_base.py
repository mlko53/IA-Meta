import json
import pandas as pd

import config
from constants import *


def create_base_df(verbose=False):
    """Create base dataframe to append all datasets to"""
    columns = get_columns(verbose=verbose)
    df = pd.DataFrame(columns=columns)

    if verbose:
        print("Successfully created base dataframe")
        print("{} COLUMNS".format(len(list(df))))
        print(list(df)) 

    return df


def load_list_from_txt(path):
    """Returns a list from .txt path"""
    with path.open('r') as f:
        l = f.read().split('\n')

    assert len(l) == len(set(l)),\
        "ERROR: Non unique list"

    return l


def get_AVI_abbreviations(AVI_words, verbose=False):
    """Returns AVI word abbreivations"""
    AVI_abbreviation = [s[:4] for s in AVI_words]
    shortened = AVI_abbreviation.copy()
    for i, abbreviation in enumerate(AVI_abbreviation):
        if shortened.count(abbreviation) > 1:
            AVI_abbreviation[i] = AVI_words[i]

    AVI_abbreviations = dict(zip(AVI_words, AVI_abbreviation))

    if verbose:
        print("Storing AVI abbreviation in {}".format(AVI_ABBREVIATION_DIR))

    with open(AVI_ABBREVIATION_DIR, 'w') as f:
        json.dump(AVI_abbreviations, f)

    return AVI_abbreviations

def get_AVI_columns(AVI_words, states=False, verbose=False):
    """Returns AVI columns"""
    if not states:
        AVI_abbreviations = get_AVI_abbreviations(AVI_words, verbose).values()
    else:
        AVI_abbreviations = AVI_words

    affect_types = ['real', 'ideal']
    compute_types = ['raw', 'ipsatized']
    who_computes = ['us', 'them']

    AVI_columns = []

    for compute_type in compute_types:
        if compute_type == 'raw' and not states:
            for affect_type in affect_types:
                for AVI_word in AVI_abbreviations:
                    col = '.'.join([affect_type[0], AVI_word, compute_type[:3]])
                    AVI_columns.append(col)

        else:
            for who in who_computes:
                for affect_type in affect_types:
                    for AVI_word in AVI_abbreviations:
                        col = '.'.join([affect_type[0], AVI_word, compute_type[:3], who])
                        AVI_columns.append(col)

    return AVI_columns

def get_columns(verbose=False):
    """Return columns of base dataframe"""

    columns = []

    meta_items = load_list_from_txt(META_DIR)
    demo_items = load_list_from_txt(DEMO_DIR)
    SES_items = load_list_from_txt(SES_DIR)
    AVI_words = load_list_from_txt(AVI_DIR)
    affective_states = load_list_from_txt(AFFECTIVE_STATES_DIR)

    if verbose:
        print("Using {} emotion words".format(len(AVI_words)))

    AVI_columns = get_AVI_columns(AVI_words, states=False, verbose=verbose)
    states_columns = get_AVI_columns(affective_states, states=True, verbose=verbose)

    columns.extend(meta_items)
    columns.extend(demo_items)
    columns.extend(SES_items)
    columns.extend(AVI_columns)
    columns.extend(states_columns)

    return columns

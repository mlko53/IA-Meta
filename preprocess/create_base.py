import json
import pandas as pd
import pprint

import config
from constants import *


def create_base_df(verbose=False):
    """Create base dataframe to append all datasets to"""
    columns = get_columns(verbose=verbose)
    df = pd.DataFrame(columns=columns)

    if verbose:
        print("Successfully created base dataframe")
        print("COLUMNS")
        pprint.pprint(list(df)) 

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

def get_AVI_columns(AVI_words, verbose=False):
    """Returns AVI columns"""
    AVI_abbreviations = get_AVI_abbreviations(AVI_words, verbose)

    return AVI_abbreviations.values()

def get_columns(verbose=False):
    """Return columns of base dataframe"""

    columns = []

    meta_items = load_list_from_txt(META_DIR)
    demo_items = load_list_from_txt(DEMO_DIR)
    SES_items = load_list_from_txt(SES_DIR)
    AVI_words = load_list_from_txt(AVI_DIR)

    if verbose:
        print("Using {} emotion words".format(len(AVI_words)))

    AVI_columns = get_AVI_columns(AVI_words, verbose=verbose)

    columns.extend(meta_items)
    columns.extend(demo_items)
    columns.extend(SES_items)
    columns.extend(AVI_columns)

    return columns

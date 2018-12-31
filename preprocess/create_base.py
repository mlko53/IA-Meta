import pandas as pd

import config
from constants import *


def create_base_df():
    """Create base dataframe to append all datasets to"""
    columns = get_columns()
    df = pd.DataFrame(columns=columns)

    return df


def load_list_from_txt(path):
    """Returns a list from .txt path"""
    with path.open('r') as f:
        l = f.read().split('\n')

    assert len(l) == len(set(l)),\
        "ERROR: Non unique list"

    return l

def get_columns():
    """Return columns of base dataframe"""

    columns = []

    meta_items = load_list_from_txt(META_DIR)
    demo_items = load_list_from_txt(DEMO_DIR)
    SES_items = load_list_from_txt(SES_DIR)
    AVI_words = load_list_from_txt(AVI_DIR)

    columns.extend(meta_items)
    columns.extend(demo_items)
    columns.extend(SES_items)
    columns.extend(AVI_words)

    return columns

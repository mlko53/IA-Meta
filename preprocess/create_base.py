import pandas as pd

from config import load_AVI_words
from constants import *


def create_base_df(config):
    """Create base dataframe to append all datasets to"""
    columns = get_columns(config)
    df = pd.DataFrame(columns=columns)

    return df


def get_columns():

    return []

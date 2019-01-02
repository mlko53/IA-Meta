import numpy as np
import pandas as pd
import json

import savReaderWriter as spss
from constants import *

def read_sav(path):
    """Read .sav files, return pandas DataFrame"""
    raw_data = list(spss.SavReader(path, returnHeader = True))
    df = pd.DataFrame(raw_data, dtype=str)
    columns = list(df.loc[0])
    #columns = [s.decode('utf-8') for s in columns]
    df.columns = columns
    df = df.iloc[1:].reset_index(drop=True) # sets column name to the first row

    return df


def load_var_name_dict(path, verbose=False):
    """Loads variable name dictionary csv"""
    var_name_dict = pd.read_csv(path)

    return var_name_dict


def load_metadata(path):
    """Loads metadata from paper path"""
    path = path / "metadata.json"

    with open(path) as f:
        metadata = json.load(f)

    return metadata


def replace(df, metadata):
    """Replace values of df"""

    return df


def rename(df, var_name_dict):
    """Rename df using variable name dictionary"""

    return df


def load_and_merge(meta_df, paper_paths, verbose=False):
    """Loads all datasets from paper paths and merge with meta_df"""

    var_name_dict = load_var_name_dict(VAR_NAME_DICT_DIR, verbose=verbose)

    for paper_path in paper_paths:
        metadata = load_metadata(paper_path)
        for study_dir in metadata['Usable']:
            df_path = paper_path / study_dir
            study = study_dir.split('.')[0]
            # read each study
            df = read_sav(df_path)

            # basic preprocessing
            df = rename(df, var_name_dict)
            df = replace(df, metadata['Replace'][study])

            meta_df = meta_df.append(df)

    return meta_df

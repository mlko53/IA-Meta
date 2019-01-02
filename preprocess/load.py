import numpy as np
import pandas as pd
import json

import savReaderWriter as spss
from constants import *

def read_sav(path):
    """Read .sav files, return pandas DataFrame"""
    raw_data = list(spss.SavReader(path, returnHeader = True))
    df = pd.DataFrame(raw_data)
    columns = list(df.loc[0])
    columns = [s.decode('utf-8') for s in columns]
    df.columns = columns
    df = df.iloc[1:].reset_index(drop=True) # sets column name to the first row

    return df


def load_var_name_dict(path, verbose=False):
    """Loads variable name dictionary csv"""
    var_name_dict = pd.read_csv(path)

    var_name_dict.index = var_name_dict['paper'].astype('str') +\
                                            '_' + var_name_dict['study']

    var_name_dict = var_name_dict.drop(['paper', 'study'], axis=1)

    if verbose:
        print("Loaded in variable name dictionary")

    return var_name_dict


def load_metadata(path):
    """Loads metadata from paper path"""
    path = path / "metadata.json"

    with open(path) as f:
        metadata = json.load(f)

    return metadata


def recode(df, study, metadata):
    """Recodes columns of df"""
    recode_map = metadata['Recode'][study]
    for col, recode_col_map in recode_map.items():
        recode_col_map = {v:k for k, v in recode_col_map.items()}
        df[col] = df[col].replace(recode_col_map)

    return df


def replace(df, study, metadata):
    """Replace values of df"""
    replace_map = metadata['Replace'][study]
    replace_map = {v:(np.nan if k==NAN else k) for k, v in replace_map.items()}

    return df.replace(replace_map)


def rename_and_drop(df, name, var_name_dict):
    """Rename df using variable name dictionary"""
    # get rename map
    rename_map = dict(var_name_dict.loc[name, ~var_name_dict.loc[name].isnull()])
    rename_map = {v:k for k, v in rename_map.items()}

    # rename
    df = df.rename(columns=rename_map)

    # drop
    df = df[list(rename_map.values())]

    return df


def load_and_merge(meta_df, paper_paths, verbose=False):
    """Loads all datasets from paper paths and merge with meta_df"""

    var_name_dict = load_var_name_dict(VAR_NAME_DICT_DIR, verbose=verbose)

    for paper_path in paper_paths:
        metadata = load_metadata(paper_path)
        paper = metadata['Paper']
        for study_dir in metadata['Usable']:
            df_path = paper_path / study_dir
            study = study_dir.split('.')[0]
            name = '_'.join([paper, study])
            # read each study
            df = read_sav(df_path)

            # basic preprocessing
            df = recode(df, study, metadata)
            df = rename_and_drop(df, name, var_name_dict)
            df = replace(df, study, metadata)

            meta_df = meta_df.append(df, sort=False)

    return meta_df

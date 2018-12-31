import argparse
import numpy as np
import pandas as pd

from pathlib import Path
#from rpy2.robjects import pandas2ri, r

from config import load_config, load_AVI_words, load_dataset_paths, validate_config
from constants import *

def get_args():
    """Preprocessing arguments"""
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--config_file",
        required = True,
        help='the file to the json file specifying the query')
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help='print status of current processes')

    return parser.parse_args()


def createBaseDataFrame():
    """Create base dataframe to append all datasets to"""
    df = pd.DataFrame()

    return df


def read_sav(path):
    """Read .sav files, return pandas DataFrame"""
    w = r('foreign::read.spss("%s", to.data.frame=TRUE)' % path)
    df = pandas2ri.ri2py(w)

    return df


if __name__ == "__main__":
    args = get_args()

    config = load_config(CONFIG_DIR / args.config_file, args.verbose)
    
    validate_config(config, args.verbose)

    AVI_words = load_AVI_words(AVI_DIR, args.verbose)

    dataset_paths = load_dataset_paths(config, args.verbose)

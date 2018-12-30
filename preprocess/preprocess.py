import argparse
import numpy as np
import pandas as pd

from pathlab import Path
from rpy2.robjects import pandas2ri, r


def get_args():
    """Preprocessing arguments"""
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--config_path",
        required = True,
        help='the path to the json file specifying the query')
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

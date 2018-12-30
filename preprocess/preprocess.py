mport numpy as np
import pandas as pd

from pathlab import Path
from rpy2.robjects import pandas2ri, r


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
    pass

import sys
from pathlib import Path
import json

sys.path.append(str(Path(__file__).absolute().parent.parent))
from constants import *


def load_grouping(path, verbose=False):
    """Read grouping file"""
    with path.open('r') as f:
        d = json.load(f)

    if verbose:
        print("Using grouping --- {}".format(d))

    grouping  = {}
    for k, v in d.items():
        for ethn in v:
            grouping[ethn] = k

    return grouping


def get_studies_with_groups(df, grouping, verbose=False):
    """Get studies with ethnicity grouping"""

    return 

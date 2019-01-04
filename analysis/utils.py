import sys
from pathlib import Path
import json

sys.path.append(str(Path(__file__).absolute().parent.parent))
from constants import *


def load_grouping(path, verbose=False):
    """Read grouping file"""
    with open(path) as f:
        group_to_ethn = json.load(f)

    if verbose:
        print("Using grouping --- {}".format(group_to_ethn))

    ethn_to_group = {}
    for k, v in group_to_ethn.items():
        for ethn in v:
            ethn_to_group[ethn] = k

    return group_to_ethn, ethn_to_group


def load_query(path, verbose=False):
    """Loads query file"""
    with path.open('r') as f:
        l = f.read().split('\n')

    assert len(l) == len(set(l)),\
        "ERROR: non unique list."

    return l

def filter_studies_with_groups(df, ethn_to_group, verbose=False):
    """Get studies with ethnicity grouping"""
    df['ethn'] = df['ethn'].map(ethn_to_group)
    df['paper_study'] = df['paper'] + '_' + df['study']

    study_list = df.groupby('paper_study')['ethn'].unique()

    mask = ["Group1" in s and "Group2" in s for s in study_list.values]

    study_list = study_list.index[mask]
    
    if verbose:
        print("Before filtering studies with groups, dataset contains...")
        print("    {} papers.".format(len(df['paper'].unique())))
        print("    {} studies.".format(len(df['paper_study'].unique())))

    df = df[df['paper_study'].isin(study_list)]
    df = df[df['ethn'].isin(["Group1", "Group2"])]

    if verbose:
        print("After filtering studies with groups, dataset contains...")
        print("    {} papers.".format(len(df['paper'].unique())))
        print("    {} studies.".format(len(df['paper_study'].unique())))

    return df

import argparse
import numpy as np
import pandas as pd

from utils import load_grouping, filter_studies_with_groups
from constants import *

def get_args():
    """Preprocessing arguments"""
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--group_file",
        required=True,
        help="the groups to use when computing effect size")
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help='print status of current processes')
    parser.add_argument(
        "--name",
        default="debugging",
        help="the file name to save as")
    parser.add_argument(
        "--meta_df_file",
        required=True,
        help="the combined dataframe to use")

    return parser.parse_args()


if __name__ == "__main__":
    args = get_args()
    
    group_to_ethn, ethn_to_group = load_grouping(ANALYSIS_DIR / args.group_file, args.verbose)

    meta_df = pd.read_csv(PREPROCESSED_DIR / args.meta_df_file)

    meta_df = filter_studies_with_groups(meta_df, ethn_to_group, args.verbose)

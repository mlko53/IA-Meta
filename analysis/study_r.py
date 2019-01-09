import argparse
import numpy as np
import pandas as pd

from utils import load_grouping, filter_studies_with_groups, load_query
from compute import compute_r
from constants import *

def get_args():
    """Preprocessing arguments"""
    parser = argparse.ArgumentParser()

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
    parser.add_argument(
        "--var1",
        required=True,
        help="first variable to correlate")
    parser.add_argument(
        "--var2",
        required=True,
        help="second variable to correlate")

    return parser.parse_args()


if __name__ == "__main__":
    args = get_args()

    if args.verbose:
        print("Computing r between {} and {}".format(args.var1, args.var2))

    meta_df = pd.read_csv(PREPROCESSED_DIR / args.meta_df_file)

    meta_df['paper_study'] = meta_df['paper'] + '_' + meta_df['study']
    meta_df = meta_df[['paper_study', args.var1, args.var2]]

    meta_df = compute_r(meta_df, args.var1, args.var2)
    
    print(meta_df)
    meta_df.to_csv(RESULTS_DIR / ("r/" + args.name))

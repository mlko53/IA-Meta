"""
Load config file and test its contents.
"""
import sys
from pathlib import Path
import json

sys.path.append(str(Path(__file__).absolute().parent.parent))
from constants import *


def load_config(path, verbose=True):
    """Read config file"""
    with path.open('r') as f:
        config = json.load(f)

    return config


def validate_config(config, verbose=False):
    """Validates config file"""

    datasets = config['Datasets']

    for year, year_dataset_list in datasets.items():
        assert len(year_dataset_list) == len(set(year_dataset_list)), \
            "Non unique papers"

    if verbose:
        print("Config tests passed!")


def load_paper_paths(config, verbose=False):
    """Return dataset paths from config file"""

    dataset_paths = []
    datasets = config['Datasets']

    for year, year_dataset_list in datasets.items():
        year_dataset_list = [DATA_DIR / (year + " " + s) \
                                for s in year_dataset_list]
        dataset_paths.extend(year_dataset_list)

    if verbose:
        print("Preprocessing {} Papers".format(len(dataset_paths)))

    return dataset_paths

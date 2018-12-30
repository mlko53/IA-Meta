"""
Load config file and test its contents.
"""
import sys
from pathlib import Path
import json

sys.path.append(str(Path(__file__).absolute().parent.parent))
from constants import *


def load_AVI_words(path, verbose=True):
    """Read AVI words"""
    with path.open('r') as f:
        AVI_words = f.read().split('\n')

    assert len(AVI_words) == len(set(AVI_words)),\
        "ERROR: Non unique AVI words"

    return AVI_words


def load_config(path, verbose=True):
    """Read config file"""
    with path.open('r') as f:
        config = json.load(f)

    validate_config(config, verbose=verbose)

    return config


def validate_config(config, verbose=False):
    
    if verbose:
        print("Config tests passed!")

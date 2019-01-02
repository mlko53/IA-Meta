"""Define constants to be used throughout the repo."""
from pathlib import Path


# Project Directories
PROJECT_DIR = Path(__file__).parent.parent
META_DIR = PROJECT_DIR / "meta"
DATA_DIR = PROJECT_DIR / "data"

# Prepro
CONFIG_DIR = PROJECT_DIR / "preprocess/config"
AVI_DIR = CONFIG_DIR / "AVI_items.txt"
AFFECTIVE_STATES_DIR = CONFIG_DIR / "affective_states.txt"
META_DIR = CONFIG_DIR / "meta_items.txt"
DEMO_DIR = CONFIG_DIR / "demo_items.txt"
SES_DIR = CONFIG_DIR / "SES_items.txt"
VAR_NAME_DICT_DIR = CONFIG_DIR / "var_name_dict.csv"

# Preprocessed
PREPROCESSED_DIR = PROJECT_DIR / "preprocessed"
AVI_ABBREVIATION_DIR = PREPROCESSED_DIR / "AVI_abbreviations.json"

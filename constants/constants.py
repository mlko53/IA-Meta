"""Define constants to be used throughout the repo."""
from pathlib import Path


# Project Directories
PROJECT_DIR = Path(__file__).parent.parent
META_DIR = PROJECT_DIR / "meta"
DATA_DIR = PROJECT_DIR / "data"
CONFIG_DIR = PROJECT_DIR / "preprocess/config"
AVI_DIR = CONFIG_DIR / "AVI_items.txt"

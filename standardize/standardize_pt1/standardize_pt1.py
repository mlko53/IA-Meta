import sys
import os
import subprocess
from standardize_ipsatize import main as std_main
from add_dates import main as dates_main
from add_ages import main as ages_main

fname = sys.argv[1]
print("Standardizing Affect Values")
custom_std = "std_step.csv"
std_main(fname, custom=custom_std)


print("Adding Dates")
custom_dates = "dates_step.csv"
dates_main(custom_std, custom=custom_dates)


print("Adding Ages")
custom_ages = "std_pt1_"+fname
ages_main(custom_dates, custom=custom_ages)


os.remove(custom_std)
os.remove(custom_dates)
import sys
import os
import subprocess
from standardize_ipsatize import main as std_main
from add_dates import main as dates_main

fname = sys.argv[1]
print("Standardizing Affect Values")
custom_std = "std_step.csv"
std_main(fname, custom=custom_std)
#fname = "standardized_"+fname

print("Adding Dates")
custom_dates = "std_pt1_"+fname
dates_main(custom_std, custom=custom_dates)

os.remove(custom_std)
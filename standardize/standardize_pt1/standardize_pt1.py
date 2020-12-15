import sys
import os
import subprocess
from standardize_ipsatize import main as std_main
from add_dates import main as dates_main
from add_ages import main as ages_main
from nonAVI import main as nonAVI_main

fname = sys.argv[1]
print("Standardizing Affect Values")
custom_std = "std_step.csv"
std_main(fname, custom=custom_std)


print("Adding Dates")
custom_dates = "dates_step.csv"
dates_main(custom_std, custom=custom_dates)


print("Adding Ages")
custom_ages = "ages_step.csv"
ages_main(custom_dates, custom=custom_ages)


print ("Adding nonAVI column")
custom_nonAVI = "std_pt1_"+fname
nonAVI_main(custom_ages, custom=custom_nonAVI)


os.remove(custom_std)
os.remove(custom_dates)
os.remove(custom_ages)
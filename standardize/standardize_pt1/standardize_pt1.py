import sys
import subprocess
from standardize_ipsatize import main as std_main
from add_dates import main as dates_main

fname = sys.argv[1]
print("Standardizing Affect Values")
std_main(fname)
fname = "standardized_"+fname

print("Adding Dates")
dates_main(fname)


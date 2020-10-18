import pandas as pd
import numpy as np

def fullprint(df):
    with pd.option_context('display.max_rows', None, 'display.max_columns', None): 
        print(df)
        
        
        
def get_min_max(df):
    ages = df.filter(regex=("age|paper_study"))
    
    mins = ages.groupby('paper_study').min().min(axis=1)
    maxs = ages.groupby('paper_study').max().max(axis=1)
    min_max = pd.concat([mins, maxs], axis=1)
    min_max.columns = ['min', 'max']
    return min_max

def get_spread(df):
    ages = df.filter(regex=("age|paper_study"))
    fullprint(ages.groupby('paper_study')['age'].value_counts())
    
    
def main(fname):
    data = pd.read_csv(fname)
    min_max = get_min_max(data)
    print(min_max)
    get_spread(data)
    

if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)
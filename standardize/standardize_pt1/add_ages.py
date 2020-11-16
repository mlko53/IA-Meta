import pandas as pd
import numpy as np


def fullprint(df):
    with pd.option_context('display.max_rows', None, 'display.max_columns', None): 
        print(df)
        
        
        
def get_min_max(df):
    ages = df.filter(regex=("age|paper_study"))
    
    mins = ages.groupby('paper_study').min(numeric_only=True).min(axis=1)
    maxs = ages.groupby('paper_study').max(numeric_only=True).max(axis=1)
    min_max = pd.concat([mins, maxs], axis=1)
    min_max.columns = ['min', 'max']
    return min_max

def get_spread(df):
    ages = df.filter(regex=("age|paper_study"))
    fullprint(ages.groupby('paper_study')['age'].value_counts().sort_index())
    
    
    
def autoconvert(val, removestr=False):
    try:
        val = float(val)
    except:
        return val
    if (pd.isnull(val)):
        return val
    
    diff = abs(val - int(val))
    if diff <= 0.00001:
        return int(val)
    else:    
        if removestr:
            return np.nan
        return val

def replace_age(data, age_mod):    
    data['age'] = data['age'].apply(lambda x: str(autoconvert(str(x).strip())) )  

    for index, row in age_mod.iterrows():
        #print(row)
        
        matching = ( (data['paper_study'].str.startswith(str(row['paper_study']).strip())) &  (data['age']==str(autoconvert(row['age']))) )
        #print(data.loc[matching, ['paper_study', 'age']])
        if (row['edit']==-1):
            data.loc[matching, 'age'] = np.nan
        else:
            data.loc[matching, 'age'] = row['edit']
        #print(data.loc[matching, ['paper_study', 'age']])
        #print('-------------------------------')
    
    return data
    
    
    
def main(fname, custom=None):
    data = pd.read_csv(fname)
    min_max = get_min_max(data)
    fullprint(min_max)
    #get_spread(data)
    age_mod = pd.read_csv('ages/ages_edit.csv')
    #print(age_mod)
    data = replace_age(data, age_mod)
    data['age'] = data['age'].apply(lambda x: autoconvert(str(x).strip()) )  
    #get_spread(data)
    fullprint(get_min_max(data))
    
    print(data)
    
    if (custom is None):
        data.to_csv("ages+"+fname)
    else:
        data.to_csv(custom)

if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)
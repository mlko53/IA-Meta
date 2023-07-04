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
    
def manual_change(df):
    
    # Fixing 2015 Sims Patients study1
    def sims_date(curr_date):
        test_year = curr_date[-4:]
        #print(curr_date, test_year)
        if test_year.isnumeric():
            test_year = int(test_year)
        else:
            test_year = int(test_year[-2:])
            if test_year > 12:
                test_year += 1900
            else:
                test_year += 2000
        return int(test_year)       
    df['age'] = df.apply(lambda x: x['age']  if (x['paper_study']!="2015 Sims Patients study1" or "nan" in x['age']) else int(float(x['collected_year']) - sims_date(x['age'])), axis=1)
    
    # Fixing 1.8e-29 error in 2021 Koopmann-Holm study1
    df['age'] = df.apply(lambda x: x['age']  if (x['paper_study']!="2021 Koopmann-Holm study1" or "nan" in str(x['age']) or int(x['age']) > 1) else np.nan, axis=1)
    return df

    
def main(fname, custom=None):
    data = pd.read_csv(fname)
    min_max = get_min_max(data)
    fullprint(min_max)
    get_spread(data)
    age_mod = pd.read_csv('ages/ages_edit.csv')
    #print(age_mod)
    data = replace_age(data, age_mod)
    data = manual_change(data)  
    data['age'] = data['age'].apply(lambda x: autoconvert(str(x).strip()) )  
    get_spread(data)
    fullprint(get_min_max(data))
    
    #get_spread(data)
    print(data)
    
    if (custom is None):
        data.to_csv("ages+"+fname)
    else:
        data.to_csv(custom)

if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)
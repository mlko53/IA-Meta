import pandas as pd
import numpy as np
import re
import copy

# takes the dates formatted in 'earliest_pub_year.csv' and 'year_collection.csv' and turns into float value
def parse_date(date):
    date = str(date)
    updated_date = date
    #print(date)
    # if split across two dates
    if " " in date:
        updated_date = date.split()
        
        year1 = updated_date[0]
        if "." in year1:
            month = int(year1.split('.')[0])
            year = int(year1.split('.')[1])
            year1 = year + month/12.0
        else:
            year1 = int(year1)+0.5
        
        year2 = updated_date[1]
        if "." in year2:
            month = int(year2.split('.')[0])
            year = int(year2.split('.')[1])
            year2 = year + month/12.0
        else:
            year2 = int(year2)+0.5        
        
        updated_date = (year1+year2)/2
        #print(year1, year2, updated_date)
    elif "." in date:
        updated_date = date.split('.')
        month = int(updated_date[0])
        year = int(updated_date[1])
        if month == 0:
            month = 6
        updated_date = year + month/12.0
    
    #print(updated_date)
    #print('-------')
    return updated_date
        
# extract regex of form d/d/d from date.time column
def regex_date(date):
    #print(date)
    if pd.isnull(date):
        return date
    date_pattern = re.compile("\d+\/\d+\/\d+|\d+\-\d+\-\d+")
    try:
        date = date_pattern.search(date).group(0)
        date = date.replace('-', ' ')
        date = date.replace('/', ' ')
    except:
        date = np.nan
    #print(date)
    return date

# extract the year first by taking max into time.year - if max is <100, then take the last one and add 2000 (if last is <30) or 1900 (if last is >30)
def get_year(date):
    if pd.isnull(date):
        #print(date, date)
        return date, date
    date_nums = date.split(' ')
    date_nums = [int(x) for x in date_nums]
    
    year = max(date_nums)
    #print('---------------')
    #print(year, date)
    
    # if it's a legit date (aka something like 20xx)
    if year>100:
        # assuming there's only one occurence of something like 20xx, we can just remove it
        date = ""
        for num in date_nums:
            if num != year:
                date+=str(num)+" "
        date = date.strip() # should be a date with the year removed
        #print(year, date)
        return year, date
    # if we can't find a legit date, just take the last one of the three
    else:
        year = date_nums[2]
        if year < 30:
            year+=2000
        else:
            year+=1900
        date = str(date_nums[0])+" "+str(date_nums[1])
        #print(year, date)
        return year, date

# swithces month and year if inputted row, and list of paper_study to switch by
def switch_month_day(row, switch_list):
    if row['paper_study'] in switch_list:
        return copy.deepcopy(row['time.day']), copy.deepcopy(row['time.month'])
    else:
        return copy.deepcopy(row['time.month']), copy.deepcopy(row['time.day'])

# recalculate collected_year values based on those 3 values and overwrite. Only take ones that have all three values, since otherwise it means there was a null error
def recalc_collection_date(row):
    if not(pd.isnull(row['time.year']) and pd.isnull(row['time.month']) and pd.isnull(row['time.day'])):
        return row['time.year'] + row['time.month']/12.0
    else:
        return row['collected_year']
    

def main(fname, custom=None):
    collected = pd.read_csv("year_collection.csv")
    collected = collected.filter(regex=("_mod")).dropna()
    earlypub = pd.read_csv("earliest_pub_year.csv")
    earlypub = earlypub.filter(regex=("_mod")).dropna()
    #stdzd_data = pd.read_csv("../../standardized_affect_data_8_17.csv")  ## CHANGE THIS FOR MOST UPDATED STANDARDIZED DATA
    stdzd_data = pd.read_csv(fname)  ## CHANGE THIS FOR MOST UPDATED STANDARDIZED DATA


    collected['collected_mod'] = collected['collected_mod'].apply(parse_date)
    earlypub['earlypub_mod'] = earlypub['earlypub_mod'].apply(parse_date)

    collected.set_index('study_name_mod', inplace=True)
    collected = collected.to_dict()['collected_mod']
    earlypub.set_index('study_name_mod', inplace=True)
    earlypub = earlypub.to_dict()['earlypub_mod']

    #print(collected)
    #print(earlypub)

    # adding earlypub_year
    stdzd_data['earlypub_year'] = stdzd_data['pub_year'].add(0.5)
    for key in earlypub:
        #print(key)
        #curr_study_df = stdzd_data[stdzd_data['paper_study'].str.startswith(key)]
        #print(curr_study_df)
        #curr_study_df['earlypub_year'] = earlypub[key]
        #print(curr_study_df['earlypub_year'])
        stdzd_data.loc[stdzd_data['paper_study'].str.startswith(key), 'earlypub_year'] = earlypub[key]
        #print(stdzd_data.loc[stdzd_data['paper_study'].str.startswith(key)]['earlypub_year'])
        
    #print(stdzd_data[stdzd_data['paper_study'].str.startswith('2018 Gentzler')])
    #print(earlypub['2018 Gentzler'])

    stdzd_data['collected_year'] = np.nan
    for key in collected:
        stdzd_data.loc[stdzd_data['paper_study'].str.startswith(key), 'collected_year'] = collected[key]
        #print(key, collected[key])
        #print(stdzd_data.loc[stdzd_data['paper_study'].str.startswith(key)]['collected_year'])



    ## ADD: 1) Overwrite with date.time 2) search using regex of d/d/d 3) identify (by study) if it's m/d/y or d/m/y    
    #print(stdzd_data['date.time'])
    stdzd_data['date.time_mod'] = stdzd_data['date.time'].apply(regex_date)

    # extract the year first by taking max into time.year - if max is <100, then take the last one and add 2000 (if last is <30) or 1900 (if last is >30)
    year_extracted = stdzd_data['date.time_mod'].apply(get_year)
    stdzd_data['time.year'] = year_extracted.apply(lambda x: x[0])
    stdzd_data['date.time_mod.2'] = year_extracted.apply(lambda x: x[1])

    # place them by default into month and day
    stdzd_data['time.month'] = stdzd_data['date.time_mod.2'].apply(lambda x: x if pd.isnull(x) else x.split()[0])
    stdzd_data['time.day'] = stdzd_data['date.time_mod.2'].apply(lambda x: x if pd.isnull(x) else x.split()[1])

    # casting to integer
    stdzd_data['time.year'] = stdzd_data['time.year'].apply(lambda x: x if pd.isnull(x) else int(x))
    stdzd_data['time.month'] = stdzd_data['time.month'].apply(lambda x: x if pd.isnull(x) else int(x))
    stdzd_data['time.day'] = stdzd_data['time.day'].apply(lambda x: x if pd.isnull(x) else int(x))

    # removing obvious input errors
    stdzd_data['time.year'] = stdzd_data['time.year'].apply(lambda x: np.nan if (not pd.isnull(x)) and (x>2030 or x<0) else x)
    stdzd_data['time.month'] = stdzd_data['time.month'].apply(lambda x: np.nan if (not pd.isnull(x)) and (x>31 or x<0) else x)
    stdzd_data['time.day'] = stdzd_data['time.day'].apply(lambda x: np.nan if (not pd.isnull(x)) and (x>31 or x<0) else x)

    # swap month and day if it seems that study has it the other way around
    switch_idxs = []  # array of which studies to switch their month and day values
    with pd.option_context('display.max_rows', None, 'display.max_columns', None):
        months = stdzd_data.groupby('paper_study')['time.month'].max()
        days = stdzd_data.groupby('paper_study')['time.day'].max()
        for idx in months.index:
            if months[idx] > 12:
                switch_idxs.append(idx)
    #print(switch_idxs)
    switched_month_day = stdzd_data.apply(switch_month_day, args=(switch_idxs), axis=1)
    stdzd_data['time.month'] = switched_month_day.apply(lambda x: x[0])
    stdzd_data['time.day'] = switched_month_day.apply(lambda x: x[1])

    # recalculate collected_year values based on those 3 values and overwrite. Only take ones that have all three values, since otherwise it means there was a null error
    stdzd_data['collected_year'] = stdzd_data.apply(recalc_collection_date, axis=1)

    # drop the mod columns
    stdzd_data = stdzd_data.drop(columns=['date.time_mod', 'date.time_mod.2', 'Unnamed: 0'])

    print(stdzd_data)
    #stdzd_data.to_csv('dates_added.csv')
    #stdzd_data.to_csv("dates+"+fname)
    if (custom is None):
        stdzd_data.to_csv("dates+"+fname)
    else:
        stdzd_data.to_csv(custom)
    

if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)


import pandas as pd
import numpy as np





def main(fname, custom=None):
    data = pd.read_csv(fname)
        
    data['nonAVI'] = 0
    nonAVI_files = pd.read_csv('nonAVI.csv')
    for idx, row in nonAVI_files.iterrows():
        curr_study = row['paper_study']+" "
        #print(curr_study)
        data.loc[data['paper_study'].str.startswith(curr_study), 'nonAVI'] = 1
        #print(data.loc[data['paper_study'].str.startswith(curr_study), 'nonAVI'])
    
    data['ourlab'] = 0
    ourlab_files = pd.read_csv('ourlab.csv')
    for idx, row in ourlab_files.iterrows():
        curr_study = row['paper_study']+" " # include space for things like 2016 Park and 2016 Parker - should have space between paper and study name
        data.loc[data['paper_study'].str.startswith(curr_study), 'ourlab'] = 1
    
    if (custom is None):
        data.to_csv("nonAVI+"+fname)
    else:
        data.to_csv(custom)

if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)
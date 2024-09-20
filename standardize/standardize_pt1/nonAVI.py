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
    
    #data['ourlab'] = 0
    data['tsailab'] = 0
    ourlab_files = pd.read_csv('ourlab.csv')
    for idx, row in ourlab_files.iterrows():
        curr_study = row['paper_study']+" " # include space for things like 2016 Park and 2016 Parker - should have space between paper and study name
        #data.loc[data['paper_study'].str.startswith(curr_study), 'ourlab'] = 1
        data.loc[data['paper_study'].str.startswith(curr_study), 'tsailab'] = 1
    
    data['CollegeCommunity'] = np.NaN
    data['ClinicalNonclinical'] = np.NaN
    moderator_files = pd.read_csv('moderators.csv')
    for idx, row in moderator_files.iterrows():
        curr_study = row['paper_study'] # no extra space since using full study # here
        curr_CollegeCommunity = row['CollegeCommunity']
        curr_ClinicalNonclinical = row['ClinicalNonclinical']
        data.loc[data['paper_study'].str.startswith(curr_study), 'CollegeCommunity'] = curr_CollegeCommunity
        data.loc[data['paper_study'].str.startswith(curr_study), 'ClinicalNonclinical'] = curr_ClinicalNonclinical
    
    # Special ones to take account:
    # 2016 Thompson study1: df$group (1 = nonclinical; 2, 3, 4 = clinical)
    data.loc[(data['paper_study'].str.startswith('2016 Thompson study1')) & (data['condition'] == 1), 'ClinicalNonclinical'] = 'Nonclinical'
    data.loc[(data['paper_study'].str.startswith('2016 Thompson study1')) & (data['condition'] == 2), 'ClinicalNonclinical'] = 'Clinical'
    data.loc[(data['paper_study'].str.startswith('2016 Thompson study1')) & (data['condition'] == 3), 'ClinicalNonclinical'] = 'Clinical'
    data.loc[(data['paper_study'].str.startswith('2016 Thompson study1')) & (data['condition'] == 4), 'ClinicalNonclinical'] = 'Clinical'
    # 2020 Arens study1: df$Group (0 = no depression; 1 = Depression)
    data.loc[(data['paper_study'].str.startswith('2020 Arens study1')) & (data['condition'] == 0), 'ClinicalNonclinical'] = 'Nonclinical'
    data.loc[(data['paper_study'].str.startswith('2020 Arens study1')) & (data['condition'] == 1), 'ClinicalNonclinical'] = 'Clinical'
    # 2021 Millgram study3: df$Group (0 = CTL; 1 = BD)
    data.loc[(data['paper_study'].str.startswith('2021 Millgram study3')) & (data['condition'] == 0), 'ClinicalNonclinical'] = 'Nonclinical'
    data.loc[(data['paper_study'].str.startswith('2021 Millgram study3')) & (data['condition'] == 1), 'ClinicalNonclinical'] = 'Clinical'
    # 2022 Mizrahi Lakan study1: df$depression (0 = nondepressed; 1 = depressed)
    data.loc[(data['paper_study'].str.startswith('2022 Mizrahi Lakan study1')) & (data['condition'] == 0), 'ClinicalNonclinical'] = 'Nonclinical'
    data.loc[(data['paper_study'].str.startswith('2022 Mizrahi Lakan study1')) & (data['condition'] == 1), 'ClinicalNonclinical'] = 'Clinical'
    # 2022 Clobert study12: ethn (College: "geo: Taiwanese", "race/ethn: European Canadian"; Community: "race/ethn: European American")
    data.loc[(data['paper_study'].str.startswith('2022 Clobert study12')) & (data['ethn'] == "geo: Taiwanese"), 'CollegeCommunity'] = 'College'
    data.loc[(data['paper_study'].str.startswith('2022 Clobert study12')) & (data['ethn'] == "race/ethn: European Canadian"), 'CollegeCommunity'] = 'College'
    data.loc[(data['paper_study'].str.startswith('2022 Clobert study12')) & (data['ethn'] == "race/ethn: European American"), 'CollegeCommunity'] = 'Community'
    
    
    if (custom is None):
        data.to_csv("nonAVI+"+fname)
    else:
        data.to_csv(custom)

if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)
import pandas as pd
import numpy as np
from scipy.stats import pearsonr
import matplotlib.pyplot as plt
import statsmodels.api as sm

PUB_YEAR_COL = 'pub_year'

def scatterplot(df, x_name, y_name, x_label, y_label, title, ethn=None, new_min=0, new_max=8):
    x_data = df[x_name]
    y_data = df[y_name]
    
    fig, ax = plt.subplots()
    ax.scatter(x_data, y_data, s = 30, color = '#539caf', alpha = 0.75)
    ax.set_title(title)
    ax.set_xlabel(x_label)
    ax.set_ylabel(y_label)
    fig.autofmt_xdate()
    
    year_avgs = df.groupby(x_name)[y_name].mean()
    ax.plot(year_avgs, color='red', label='All ethn')
    if ethn is not None:
        ethn_df = df.loc[df['ethn'] == ethn]
        ethn_df = ethn_df.groupby(x_name)[y_name].mean()
        ax.plot(ethn_df, color='blue', label=ethn)
        ax.legend()
        
    ax.set_ylim(new_min-1, new_max+1)
    
    clean_df = df[[x_name, y_name]].dropna()
    model = sm.OLS(clean_df[y_name], sm.add_constant(clean_df[x_name]))
    p = dict(model.fit().params)
    year_min = df[PUB_YEAR_COL].min()
    year_max = df[PUB_YEAR_COL].max()
    x = np.arange(year_min, year_max+1)
    print("Slope: "+str(p[x_name]))
    ax.plot(x, p['const'] + p[x_name] * x, color='#51f542', label="regression")
    
    
    
    
    
def fullprint(df):
    with pd.option_context('display.max_rows', None, 'display.max_columns', None): 
        print(df)
        
        
        
def get_min_max(df, cols):
    affect_words = df.filter(regex=("raw$|paper_study"))
    
    mins = affect_words.groupby('paper_study').min().min(axis=1)
    maxs = affect_words.groupby('paper_study').max().max(axis=1)
    #fullprint(mins)
    #fullprint(maxs)  
    min_max = pd.concat([mins, maxs], axis=1)
    min_max.columns = ['min', 'max']
    return min_max
    
    
    
def standardize(min_max_ranges, data, affect_cols, new_min, new_max):
    new_diff = new_max - new_min
    
    
    for paper_name, paper_vals in min_max_ranges.iterrows():
        paper_min = paper_vals['min']
        paper_max = paper_vals['max']
        old_diff = paper_max - paper_min
        
        curr_rows = data.loc[data['paper_study'] == str(paper_name), affect_cols]
        #print(curr_rows)
        curr_rows = curr_rows.sub(paper_min)
        curr_rows = curr_rows.mul(new_diff / old_diff)
        curr_rows = curr_rows.add(new_min)
        data.loc[data['paper_study'] == str(paper_name), affect_cols] = curr_rows
        #print(curr_rows)
        #print(data.loc[data['paper_study'] == str(paper_name), affect_cols])
        #print(paper_name, paper_min, paper_max)
        #print('--')
    
    return data

        
def manual_change(df, cols):
    # drop anything outside of actual range
    
    #2015 Sims study3  1-9 to 1-5
    df.loc[df['paper_study'] == "2015 Sims study3", cols] = df.loc[df['paper_study'] == "2015 Sims study3", cols].apply(lambda x: np.where(x > 5, np.nan, x))
    #2016 Da Jiang LTP study11 0-5 to 1-5
    df.loc[df['paper_study'] == "2016 Da Jiang LTP study11", cols] = df.loc[df['paper_study'] == "2016 Da Jiang LTP study11", cols].apply(lambda x: np.where(x < 1, np.nan, x))
    #2016 Da Jiang LTP study2  1-6 to 1-5
    df.loc[df['paper_study'] == "2016 Da Jiang LTP study2", cols] = df.loc[df['paper_study'] == "2016 Da Jiang LTP study2", cols].apply(lambda x: np.where(x > 5, np.nan, x))
    #2017 Oosterhoff study1 1-6 to 1-5
    df.loc[df['paper_study'] == "2017 Oosterhoff study1", cols] = df.loc[df['paper_study'] == "2017 Oosterhoff study1", cols].apply(lambda x: np.where(x > 5, np.nan, x))
    #Unpublished Cheung study1 1-7 to 1-5
    df.loc[df['paper_study'] == "Unpublished Cheung study1", cols] = df.loc[df['paper_study'] == "Unpublished Cheung study1", cols].apply(lambda x: np.where(x > 5, np.nan, x))
    
    return df  
    
    
def ipsatize(df, cols):
    df["mean"] = df[cols].mean(axis=1, skipna=True)
    df["std"]  = df[cols].std(axis=1, skipna=True)    
    
    for col in cols:
        df[col] = (df[col] - df['mean']) / df['std']
    
    return df
    
    
    
def main(fname):
    #data = pd.read_csv('meta_df_8_17.csv.csv')
    data = pd.read_csv(fname)
    data['paper_study'] = data.apply(lambda x: x['paper']+" "+x['study'], axis=1)
        
    
    # affect_words = filter *.raw_input    
    affect_words = data.filter(regex=("raw$|paper_study|^ethn$"))
    affect_cols = affect_words.columns.drop('paper_study').drop('ethn')
    # casting types
    data[affect_cols] = data[affect_cols].apply(pd.to_numeric)
    data['paper_study'] = data['paper_study'].astype(str)
    data['ethn'] = data['ethn'].astype(str)
    # cut off > 20
    data[affect_cols] = data[affect_cols].apply(lambda x: np.where(x > 20, np.nan, x))
    
    # fixing further out of bound errors that will get caught in min max otherwise
    data = manual_change(data, affect_cols)
    
    # get_min_max
    min_max = get_min_max(data, affect_cols)
    print("Old min and max:")
    fullprint(min_max)
    
    
    
    
    
    # standardize
    #affect_words = affect_words.set_index(['paper_study'])
    new_min = 1
    new_max = 5
    raw_cols = data.filter(regex=("raw")).columns
    #pd.options.display.max_seq_items=None
    #print(raw_cols)
    
    data = standardize(min_max, data, raw_cols, new_min=new_min, new_max=new_max)
    print("New min and max:")
    fullprint(get_min_max(data, affect_cols))
    
    # ipsatize
    # affect_words = ipsatize(affect_words, affect_cols)
    
    #get HAP, LAP, year
    #year
    data[PUB_YEAR_COL] = data['paper_study'].apply(lambda x: x[:4])
    #print(affect_words['year'])
    data[PUB_YEAR_COL] = data[PUB_YEAR_COL].apply(lambda x: int(x) if x.isdigit() else np.nan)
    #print(affect_words['year'])
    #r.HAP, r.LAP, i.HAP, i.LAP
    #data['r.HAP'] = data[['r.exci.raw', 'r.elat.raw', 'r.euph.raw', 'r.enth.raw']].mean(axis=1, skipna=True)
    #data['r.LAP'] = data[['r.calm.raw', 'r.peac.raw', 'r.sere.raw', 'r.rela.raw']].mean(axis=1, skipna=True)
    #data['i.HAP'] = data[['i.exci.raw', 'i.elat.raw', 'i.euph.raw', 'i.enth.raw']].mean(axis=1, skipna=True)
    #data['i.LAP'] = data[['i.calm.raw', 'i.peac.raw', 'i.sere.raw', 'i.rela.raw']].mean(axis=1, skipna=True)
    data['r.HAP'] = data[['r.exci.raw', 'r.elat.raw', 'r.euph.raw', 'r.enth.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['r.LAP'] = data[['r.calm.raw', 'r.peac.raw', 'r.sere.raw', 'r.rela.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.HAP'] = data[['i.exci.raw', 'i.elat.raw', 'i.euph.raw', 'i.enth.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.LAP'] = data[['i.calm.raw', 'i.peac.raw', 'i.sere.raw', 'i.rela.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    print(data)
    #r.POS, i.POS, r.NEG, i.NEG
    #data['r.POS'] = data[['r.happ.raw', 'r.content.raw', 'r.sati.raw']].mean(axis=1, skipna=True)
    #data['i.POS'] = data[['i.happ.raw', 'i.content.raw', 'i.sati.raw']].mean(axis=1, skipna=True)
    #data['r.NEG'] = data[['r.lone.raw', 'r.sadx.raw', 'r.unha.raw']].mean(axis=1, skipna=True)
    #data['i.NEG'] = data[['i.lone.raw', 'i.sadx.raw', 'i.unha.raw']].mean(axis=1, skipna=True)
    data['r.POS'] = data[['r.happ.raw', 'r.content.raw', 'r.sati.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.POS'] = data[['i.happ.raw', 'i.content.raw', 'i.sati.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['r.NEG'] = data[['r.lone.raw', 'r.sadx.raw', 'r.unha.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.NEG'] = data[['i.lone.raw', 'i.sadx.raw', 'i.unha.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    #r.HAN, i.HAN, r.LAN, i.HAN
    #data['r.HAN'] = data[['r.host.raw', 'r.nerv.raw', 'r.fear.raw']].mean(axis=1, skipna=True)
    #data['i.HAN'] = data[['i.host.raw', 'i.nerv.raw', 'i.fear.raw']].mean(axis=1, skipna=True)
    #data['r.LAN'] = data[['r.dull.raw', 'r.slee.raw', 'r.slug.raw']].mean(axis=1, skipna=True)
    #data['i.LAN'] = data[['i.dull.raw', 'i.slee.raw', 'i.slug.raw']].mean(axis=1, skipna=True)
    data['r.HAN'] = data[['r.host.raw', 'r.nerv.raw', 'r.fear.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.HAN'] = data[['i.host.raw', 'i.nerv.raw', 'i.fear.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['r.LAN'] = data[['r.dull.raw', 'r.slee.raw', 'r.slug.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.LAN'] = data[['i.dull.raw', 'i.slee.raw', 'i.slug.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    #r.HA, i.HA, r.LA, i.LA
    data['r.HA'] = data[['r.asto.raw', 'r.surp.raw']].dropna(thresh=2).mean(axis=1, skipna=True)
    data['i.HA'] = data[['i.asto.raw', 'i.surp.raw']].dropna(thresh=2).mean(axis=1, skipna=True)
    data['r.LA'] = data[['r.idle.raw', 'r.inac.raw', 'r.pass.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
    data['i.LA'] = data[['i.idle.raw', 'i.inac.raw', 'i.pass.raw']].dropna(thresh=3).mean(axis=1, skipna=True)
        
    
    # slicing ethnicity
    # data = data.loc[data['ethn'] == "European American"]
    
    ethn_slice = "European American"
    
    
    # analyses
    print("Pub Year x r.HAP", data[PUB_YEAR_COL].corr(data['r.HAP']))
    pubyear_rHAP = data[[PUB_YEAR_COL, 'r.HAP']].dropna()
    print(pearsonr(pubyear_rHAP[PUB_YEAR_COL], pubyear_rHAP['r.HAP']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='r.HAP', x_label="Publication Year", y_label="Actual HAP (raw)", title="Actual HAP over Time",new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    print("Pub Year x r.LAP", data[PUB_YEAR_COL].corr(data['r.LAP']))
    pubyear_rLAP = data[[PUB_YEAR_COL, 'r.LAP']].dropna()
    print(pearsonr(pubyear_rLAP[PUB_YEAR_COL], pubyear_rLAP['r.LAP']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='r.LAP', x_label="Publication Year", y_label="Actual LAP (raw)", title="Actual LAP over Time", new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    print("Pub Year x i.HAP", data[PUB_YEAR_COL].corr(data['i.HAP']))
    pubyear_iHAP = data[[PUB_YEAR_COL, 'i.HAP']].dropna()
    print(pearsonr(pubyear_iHAP[PUB_YEAR_COL], pubyear_iHAP['i.HAP']))    
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='i.HAP', x_label="Publication Year", y_label="Ideal HAP (raw)", title="Ideal HAP over Time", new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    print("Pub Year x i.LAP", data[PUB_YEAR_COL].corr(data['i.LAP']))
    pubyear_iLAP = data[[PUB_YEAR_COL, 'i.LAP']].dropna()
    print(pearsonr(pubyear_iLAP[PUB_YEAR_COL], pubyear_iLAP['i.LAP']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='i.LAP', x_label="Publication Year", y_label="Ideal LAP (raw)", title="Ideal LAP over Time", new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    
    # more analyses
    print("Pub Year x r.HAN", data[PUB_YEAR_COL].corr(data['r.HAN']))
    pubyear_rHAN = data[[PUB_YEAR_COL, 'r.HAN']].dropna()
    print(pearsonr(pubyear_rHAN[PUB_YEAR_COL], pubyear_rHAN['r.HAN']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='r.HAN', x_label="Publication Year", y_label="Actual HAN (raw)", title="Actual HAN over Time",new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    print("Pub Year x r.LAN", data[PUB_YEAR_COL].corr(data['r.LAN']))
    pubyear_rLAN = data[[PUB_YEAR_COL, 'r.LAN']].dropna()
    print(pearsonr(pubyear_rLAN[PUB_YEAR_COL], pubyear_rLAN['r.LAN']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='r.LAN', x_label="Publication Year", y_label="Actual LAN (raw)", title="Actual LAN over Time",new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    print("Pub Year x i.HAN", data[PUB_YEAR_COL].corr(data['i.HAN']))
    pubyear_iHAN = data[[PUB_YEAR_COL, 'i.HAN']].dropna()
    print(pearsonr(pubyear_iHAN[PUB_YEAR_COL], pubyear_iHAN['i.HAN']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='i.HAN', x_label="Publication Year", y_label="Ideal HAN (raw)", title="Ideal HAN over Time",new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    print("Pub Year x i.LAN", data[PUB_YEAR_COL].corr(data['i.LAN']))
    pubyear_iLAN = data[[PUB_YEAR_COL, 'i.LAN']].dropna()
    print(pearsonr(pubyear_iLAN[PUB_YEAR_COL], pubyear_iLAN['i.LAN']))
    scatterplot(data, x_name=PUB_YEAR_COL, y_name='i.LAN', x_label="Publication Year", y_label="Ideal LAN (raw)", title="Ideal LAN over Time",new_min=new_min, new_max=new_max, ethn=ethn_slice)
    print()
    
    

    #plt.show()

    # writing it out
    #data.to_csv('standardized_affect_data_test.csv')
    data.to_csv('standardized_'+fname)
    
if __name__ == "__main__":
    import sys
    fname = sys.argv[1]
    main(fname)
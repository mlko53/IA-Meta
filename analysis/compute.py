import numpy as np
import pandas as pd


def build_aggregator(query_cols):
    """Building mapping from var name to mean and std"""
    agg_query = {}

    for var in query_cols:
        agg_query[var] =\
            lambda x: [np.nanmean(x), np.nanstd(x, ddof=1), np.count_nonzero(~np.isnan(x))]

    return agg_query


def compute_group_mean_sd(df, query_cols):
    """Compute mean and sd of query cols"""

    agg_query = build_aggregator(query_cols)
    df = df.groupby(['paper_study', 'ethn']).agg(agg_query).reset_index()

    for col in query_cols:
        df[[col+'_mean', col+'_sd', col+'_n']] = pd.DataFrame(df[col].values.tolist(), index=df.index)
        df = df.drop([col], axis=1)

    return df


def compute_d(df, query_cols):
    """Compute difference mean and sd of query cols"""

    df = compute_group_mean_sd(df, query_cols)

    return df

    studies_list = set(df['paper_study'].values)
    df.index = df['paper_study'] + '_' + df['ethn']

    d = {}
    for col in query_cols:
        mean = []
        sd = []
        n = []
        effect_size = []
        for study in studies_list:
            
            mean2 = df.loc[study + '_Group2', col + '_mean']
            mean1 = df.loc[study + '_Group1', col + '_mean']
            sd2 = df.loc[study + '_Group2', col + '_sd']
            sd1 = df.loc[study + '_Group1', col + '_sd']
            n2 = df.loc[study + '_Group2', col + '_n']
            n1 = df.loc[study + '_Group1', col + '_n']

            study_mean = mean2 - mean1

            study_sd = np.sqrt(((n1 - 1) * sd1 ** 2 + (n2 - 1) * sd2 ** 2) / (n1 + n2 - 2))

            study_d = study_mean / study_sd

            mean.append(study_mean)
            sd.append(study_sd)
            n.append(n2 + n1)
            effect_size.append(study_d)

        d[col+'_diff_mean'] = mean
        d[col+'_diff_sd'] = sd
        d['n'] = n
        d[col+'_d'] = effect_size

    d = pd.DataFrame(d, index = studies_list)

    return d


def compute_r(df, var1, var2):
    """Computes correlation coefficient for each study between var1 and var2"""
    
    count = df.dropna(axis=0, how='any').groupby('paper_study').count()
    count = count.iloc[:, 1:]
    count.columns = ['n']

    df = df.groupby('paper_study').corr().iloc[0::2, -1]
    df = df.reset_index(1).iloc[:, 1:]
    df.columns = ['_'.join(['corr', var1, var2])]

    df = df.join(count)

    return df

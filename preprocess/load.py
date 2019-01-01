import pandas as pd

import savReaderWriter as spss

def read_sav(path):
    """Read .sav files, return pandas DataFrame"""
    raw_data = list(spss.SavReader(path, returnHeader = True))
    df = pd.DataFrame(raw_data)
    columns = list(df.loc[0])
    columns = [s.decode('utf-8') for s in columns]
    df.columns = columns
    df = df.iloc[1:].reset_index(drop=True) # sets column name to the first row

    return df

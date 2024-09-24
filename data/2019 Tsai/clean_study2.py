import pandas as pd
import numpy as np

# DataFrame
df = pd.read_csv("study2_uncleaned.csv")

# Function to determine the value of ethn_combined
def determine_ethn_combined(row):
    if pd.isna(row['ethni_r']):
        return np.nan
    elif row['ethni_r'] == 0:
        return 'EuAm'
    elif row['ethni_r'] == 2:
        return 'HKC'
    elif row['ethni_r'] == 1:
        if row['GEQ_ASel'] == 1:
            return 'ChAm'
        elif row['GEQ_ASel'] == 2:
            return 'JaAm'
        elif row['GEQ_ASel'] == 3:
            return 'KoAm'
        elif row['GEQ_ASel'] == 4:
            return 'ViAm'
        else:
            return 'AsAm'
    else:
        return np.nan

# Apply the function to create the new column
df['ethn_combined'] = df.apply(determine_ethn_combined, axis=1)

# Display the updated DataFrame
df.to_csv("study2.csv", index=False)

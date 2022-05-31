import pandas as pd

df = pd.read_csv('./download')
df['DATA_ALTA'] = df['MES_DATA_ALTA'].astype(str) + '/' + df['DIA_DATA_ALTA'].astype(str) + \
    '/' + df['ANY_DATA_ALTA'].astype(str)

df['DATA_TANCAMENT'] = df['MES_DATA_TANCAMENT'].astype(str) + '/' + df['DIA_DATA_TANCAMENT'].astype(str) + \
    '/' + df['ANY_DATA_TANCAMENT'].astype(str)

df = df.drop(columns=['MES_DATA_ALTA', 'DIA_DATA_ALTA', 'ANY_DATA_ALTA',
             'MES_DATA_TANCAMENT', 'DIA_DATA_TANCAMENT', 'ANY_DATA_TANCAMENT'])

df.to_csv('raw_data.csv', index=False)

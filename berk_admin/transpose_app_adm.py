import os

import pandas as pd

YEAR_GROUP = [2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017]
# YEAR_GROUP = [2008, 2009, 2010, 2011, 2012]

columns = ['cal1', 'city', 'county', 'school', 'ethnic', 'year', 'app', 'adm', 'enr']
all_df = pd.DataFrame()


def read_all():
    for year in YEAR_GROUP:
        # input_file_name = 'data/ucla_%s' % year
        input_file_name = 'data/ucsd%s' % year
        # input_file_name = 'data/%s_FR_ENR_data.csv' % year # berk
        flattern(input_file_name, year)
    all_df.to_csv('data/all.csv', encoding='utf8')


def flattern(input_file_name, year):
    global all_df
    cwd = os.getcwd()
    input_file_name = cwd + '/' + input_file_name
    df = pd.read_csv(input_file_name, header=1, sep='\t', encoding='UTF-16')  # ucla
    # df = pd.read_csv(input_file_name, header=1)
    df.columns = ['cal1', 'city', 'county', 'name', 'school', 'ethnic', 'val']
    df['year'] = year
    all_df = all_df.append(df, ignore_index=True)

    print('ss')


if __name__ == "__main__":
    try:
        read_all()
    except Exception as e:
        print('Failed to work' + str(e))

import os

import pandas as pd

SAMPLE_DATA = 'data/source_data.csv'

YEAR_GROUP = [2011, 2012, 2013, 2014, 2015, 2016, 2017]

INPUT_GROUP = ['data/ucla_2013.csv', 'data/ucla_2014.csv',
               'data/ucla_2015.csv', 'data/ucla_2016.csv',
               'data/ucla_2017.csv']

all_df = pd.DataFrame()


def read_all(college):
    for year in YEAR_GROUP:
        input_file_name = 'data/gpa%s' % year
        flattern(input_file_name, year, college)
    all_df.to_csv('data/all.csv', encoding='utf8')


def flattern(input_file_name, year, college):
    global all_df
    cwd = os.getcwd()
    input_file_name = cwd + '/' + input_file_name
    df = pd.read_csv(input_file_name, header=1, sep='\t', encoding='UTF-16')  # ucla
    # df = pd.read_csv(input_file_name, header=1)
    df.columns = ['cal1', 'city', 'county', 'name', 'school', 'val']
    df['year'] = year
    df['college'] = college
    all_df = all_df.append(df, ignore_index=True)

    print('ss')


if __name__ == "__main__":
    try:
        college = 'berkeley'  #
        read_all(college)
    except Exception as e:
        print('Failed to work' + str(e))

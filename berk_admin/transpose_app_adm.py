import os
import pandas as pd

SAMPLE_DATA = 'data/source_data.csv'

YEAR_GROUP = [2013, 2014, 2015, 2016, 2017]
# YEAR_GROUP = [2008, 2009, 2010, 2011, 2012]
# YEAR_GROUP = [2009, 2010, 2011, 2012]

INPUT_GROUP = ['data/ucla_2013.csv', 'data/ucla_2014.csv',
               'data/ucla_2015.csv', 'data/ucla_2016.csv',
               'data/ucla_2017.csv']

columns = ['cal1', 'city', 'county', 'school', 'ethnic', 'year', 'app', 'adm', 'enr']
all_df = pd.DataFrame()


def read_all():
    for year in YEAR_GROUP:
        input_file_name = 'data/ucla_%s.csv' % year
        # input_file_name = 'data/%s_FR_ENR_data.csv' % year # berk
        flattern(input_file_name, year)
    all_df.to_csv('data/all.csv', encoding='utf8')

def flattern(input_file_name, year):
    global all_df
    cwd = os.getcwd()
    input_file_name = cwd + '/' + input_file_name
    df = pd.read_csv(input_file_name, header=1, sep='\t', encoding='UTF-16') #ucla
    # df = pd.read_csv(input_file_name, header=1)
    df.columns = ['cal1', 'city', 'county', 'name', 'school', 'ethnic', 'val']
    df['year'] = year
    all_df = all_df.append(df, ignore_index=True)
    # df['year', 'app', 'adm', 'enr'] = (year, 0, 0, 0)
    # ndf=df['cal1', 'city', 'county','year','app','adm', 'enr','ethnic' ]

    # last_index = 0
    # current_cal1 = next_cal1 = ''
    # is_new_row = False
    # tmp_df = pd.DataFrame
    # (app_val, adm_val, enr_val) = (0, 0, 0)
    # for index, row in df.iterrows():
    #     start_ts = calendar.timegm(time.gmtime())
    #     ol = []
    #     current_cal1 = row['cal1']
    #     if current_cal1 != next_cal1:
    #         next_cal1 = current_cal1
    #         is_new_row = True
    #     if is_new_row:
    #         if df['name'] == 'app':
    #             app_val = df['val']
    #         if df['name'] == 'adm':
    #             adm_val = df['val']
    #         if df['name'] == 'enr':
    #             enr_val = df['val']
    #
    #             tmp_df['cal1', 'city', 'county', 'name', 'school', 'app'] = (
    #                 df['cal1', 'city', 'county', 'name', 'school', 'val'])

    print('ss')


if __name__ == "__main__":
    try:
        read_all()
    except Exception as e:
        print('Failed to work' + str(e))

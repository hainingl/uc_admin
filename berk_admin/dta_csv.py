import pandas as pd
data = pd.io.stata.read_stata('/Users/f3b8i2z/my_download/preholistic.dta')
data.to_csv('my_stata_file.csv')
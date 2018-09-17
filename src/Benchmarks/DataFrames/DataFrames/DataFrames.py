## setup
import time
mintrials = 10

def timeit(name):
    tmin = float('inf')
    for i in range(mintrials):
        t = time.time()
        f = main()
        t = time.time()-t
        if t < tmin: tmin = t

    print(name + "\t" + str(tmin*1000))

## benchmarks here
import pandas as pd
import os, math

def main():
    df = pd.read_csv(os.path.join(os.path.dirname(__file__),"../../../../Data/dataframe.csv"))
    return df.shape[0]

assert main() == 10000
timeit("Loading a 10k row dataframe")

df = pd.read_csv(os.path.join(os.path.dirname(__file__),"../../../../Data/dataframe.csv"))
df2 = df.head(500)

def main():
    return pd.merge(df2,df2,on='d').shape

assert main() == (125018,7)
timeit("join")

def main():
    df['a'] = df['a'].apply(math.sin)
timeit("apply function on a column")

def main():
    df.sort_values(['b','d'])
timeit("sort")

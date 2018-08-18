#from scipy.stats import gamma
#import numpy as np
import time

def main():
    1

#assert main()

# timeit
mintrials = 5

tmin = float('inf')
for i in range(mintrials):
    t = time.time()
    f = main()
    t = time.time()-t
    if t < tmin: tmin = t

print(str(tmin*1000))

## setup
import time
mintrials = 5

def timeit(name):
    tmin = float('inf')
    for i in range(mintrials):
        t = time.time()
        f = main()
        t = time.time()-t
        if t < tmin: tmin = t

    print(name + "\t" + str(tmin*1000))

## benchmarks here
from scipy.optimize import minimize, rosen
import numpy as np

def main():
    minimize(rosen, -5*np.ones(9), method='nelder-mead', options={'xtol': 1e-16, 'maxiter' : 1500, 'maxfev' : 5000 })

timeit("Optimize a function with Nelder-Mead")

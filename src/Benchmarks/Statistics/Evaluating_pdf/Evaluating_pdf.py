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

##

from scipy.stats import gamma, binom, norm
import numpy as np

def main():
    s = 0.0
    for a in np.linspace(1,2,100):
        for x in range(0,101):
            s = s + gamma.pdf(x,a)
    return s

assert abs(main()-79.19414904703733) < 1e-12

timeit("Evaluate pdf")

def main():
    s = 0.0
    x = np.arange(5001)
    for a in np.linspace(1,2,100):
        s = s + sum(gamma.pdf(x,a))
    return s

timeit("Evaluate pdf (vectorized)")

def main():
    s1 = norm(0,1).rvs(size=1000)
    s2 = binom(100,0.1).rvs(size=1000)
    s3 = gamma(1).rvs(size=1000)

    s1[-1]+s2[-1]+s3[-1]

timeit("Generate random numbers")

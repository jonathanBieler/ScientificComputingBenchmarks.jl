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

##

from scipy.stats import gamma, binom, norm, beta, multinomial
import numpy as np

def main():
    s = 0.0
    for x in range(0,200):
        s = s + norm.pdf(x,0,1)
        s = s + binom.pmf(x,100,0.1)
        s = s + gamma.pdf(x,1,1)
        s = s + beta.pdf(x/200,1,2)
        s = s + multinomial.pmf([x,200-x,0],200,[1/3, 1/3, 1/3])
    return s

assert abs(main()-204.28144784974535) < 1e-12
timeit("Evaluate pdf")

def main():
    s = 0.0
    x = np.arange(201)
    s = s + sum(norm.pdf(x,0,1))
    s = s + sum(binom.pmf(x,100,0.1))
    s = s + sum(gamma.pdf(x,1,1))
    s = s + sum(beta.pdf(x/200,1,2))
    s = s + sum(multinomial.pmf([[x,200-x,0] for x in x],200,[1/3, 1/3, 1/3]))
    return s

assert abs(main()-204.28144784974535) < 1e-12
timeit("Evaluate pdf (vectorized)")

def main():
    N = 1000
    s1 = norm(0,1).rvs(size=N)
    s2 = binom(100,0.1).rvs(size=N)
    s3 = gamma(1,1).rvs(size=N)
    s4 = beta(1,2).rvs(size=N)
    s5 = multinomial(200,[1/3, 1/3, 1/3]).rvs(size=N)
    return s1[-1]+s2[-1]+s3[-1]+s4[-1]+s5[-1]

timeit("Generate random numbers")

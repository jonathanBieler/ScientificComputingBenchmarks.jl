from scipy.stats import gamma, binom, norm
import time

def main():
    s1 = norm(0,1).rvs(size=1000)
    s2 = binom(100,0.1).rvs(size=1000)
    s3 = gamma(1).rvs(size=1000)

    s1[-1]+s2[-1]+s3[-1]

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

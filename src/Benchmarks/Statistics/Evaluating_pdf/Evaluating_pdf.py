from scipy.stats import gamma
import numpy as np
import time

def main():
    s = 0.0
    x = np.arange(1001)
    for a in np.linspace(1,2,100):
        s = s + sum(gamma.pdf(x,a))
    return s


assert abs(main()-79.19414904703733) < 1e-12

# timeit
mintrials = 5

tmin = float('inf')
for i in range(mintrials):
    t = time.time()
    f = main()
    t = time.time()-t
    if t < tmin: tmin = t

print(str(tmin*1000))

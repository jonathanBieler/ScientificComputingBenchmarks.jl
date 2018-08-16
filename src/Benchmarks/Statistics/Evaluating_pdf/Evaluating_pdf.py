from scipy.stats import gamma
import time

def main():
    s = 0.0
    for a in range(1,2,100):
        for x in range(0,1000):
            s = s + gamma.pdf(x,a)
        return s

# timeit
def print_perf(tmin):
    print(str(tmin*1000))

mintrials = 5

tmin = float('inf')
for i in range(mintrials):
    t = time.time()
    f = main()
    t = time.time()-t
    if t < tmin: tmin = t

print_perf(tmin)

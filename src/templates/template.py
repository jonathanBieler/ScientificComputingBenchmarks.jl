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

def main():
    time.sleep(0.1)

timeit("sleep 0.1")

def main():
    time.sleep(0.2)

timeit("sleep 0.2")

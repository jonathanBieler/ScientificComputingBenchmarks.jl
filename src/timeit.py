import time

def timeit(f):
    mintrials = 5
    tmin = float('inf')
    for i in range(mintrials):
        t = time.time()
        f()
        t = time.time()-t
        if t < tmin: tmin = t
    print(str(tmin*1000))

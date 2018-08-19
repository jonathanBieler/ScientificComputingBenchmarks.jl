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

def main():
    time.sleep(0.1)

timeit("Sleep for 0.1s")

import time

def main():
    time.sleep(0.1)

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

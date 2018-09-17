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

def RK4(f):
    return lambda t, y, dt: (
            lambda dy1: (
            lambda dy2: (
            lambda dy3: (
            lambda dy4: (dy1 + 2*dy2 + 2*dy3 + dy4)/6
            )( dt * f( t + dt  , y + dy3   ) )
	    )( dt * f( t + dt/2, y + dy2/2 ) )
	    )( dt * f( t + dt/2, y + dy1/2 ) )
	    )( dt * f( t       , y         ) )


from math import sqrt

def main():
    dy = RK4(lambda t, y: t*sqrt(y))
    t, y, dt = 0., 1., .1
    for i in range(0,1001):
        t, y = t + dt, y + dy( t, y, dt )
    return y

assert (main() - 6.280048524572245e6) < 1e-12
timeit("Runge-Kutta method")

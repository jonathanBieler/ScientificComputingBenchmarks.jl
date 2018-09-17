source("../src/timeit.R")

## benchmarks here

rk4 <- function(f, x0, y0, x1, n) {
    vx <- double(n + 1)
    vy <- double(n + 1)
    vx[1] <- x <- x0
    vy[1] <- y <- y0
    h <- 0.1
    for(i in 1:n) {
        k1 <- h*f(x, y)
        k2 <- h*f(x + 0.5*h, y + 0.5*k1)
        k3 <- h*f(x + 0.5*h, y + 0.5*k2)
        k4 <- h*f(x + h, y + k3)
        vx[i + 1] <- x <- x0 + i*h
        vy[i + 1] <- y <- y + (k1 + k2 + k2 + k3 + k3 + k4)/6
    }
    cbind(vx, vy)
}

main = function(){
    sol <- rk4(function(x, y) x*sqrt(y), 0, 1, 10, 1001)
    sol[101]
}

stopifnot( (main() - 6.280048524572245e6) < 1e-12 )
timeit("Sleep 0.1",main)

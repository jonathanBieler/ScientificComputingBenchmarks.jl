include(joinpath(@__DIR__,"../../../timeit.jl"))

function main()
    f(x, y) = x * sqrt(y)
    theoric(t) = (t ^ 2 + 4.0) ^ 2 / 16.0

    rk4(f) = (t, y, δt) ->  # 1st (result) lambda
             ((δy1) ->      # 2nd lambda
             ((δy2) ->      # 3rd lambda
             ((δy3) ->      # 4th lambda
             ((δy4) -> ( δy1 + 2δy2 + 2δy3 + δy4 ) / 6 # 5th and deepest lambda: calc y_{n+1}
             )(δt * f(t + δt, y + δy3))         # calc δy₄
             )(δt * f(t + δt / 2, y + δy2 / 2)) # calc δy₃
             )(δt * f(t + δt / 2, y + δy1 / 2)) # calc δy₂
             )(δt * f(t, y))                    # calc δy₁

    δy = rk4(f)
    t₀, δt = 0.0, 0.1
    y₀ = 1.0

    t, y = t₀, y₀
    for i=1:1001
        y += δy(t, y, δt)
        t += δt
    end
    y
end

@assert (main() - 6.280048524572245e6) < 1e-12
timeit("Runge-Kutta method",main)

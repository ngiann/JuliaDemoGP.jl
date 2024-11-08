function toydata()

    x = [rand(15)*3.5; rand(15)*4.0 .+ 6.0]

    y = sin.(x) + 0.1*randn(length(x))

    return x, y

end
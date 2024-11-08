function toydata()

    x = rand(30)*10

    y = sin.(x) + 0.1*randn(length(x))

    return x, y

end
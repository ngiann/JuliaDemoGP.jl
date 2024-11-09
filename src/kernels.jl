abstract type AbstractKernel end

struct RBF <:AbstractKernel 

    distance::Metric

end

function RBF() # constructor

    RBF(Distances.Euclidean()) # default metric is Euclidean

end


function evaluatekernel(kernel::RBF, x, y; θ)
   
    d = evaluate(kernel.distance, x, y)

    θ[1]^2*exp(-d^2 /  θ[2]^2)

end


function (kernel::RBF)(x, y; θ) # callable struct

    d = evaluate(kernel.distance, x, y)

    θ[1]^2*exp(-d^2 /  θ[2]^2)

end

numparams(kernel::RBF) = 2

calculatecovariance(kernel::AbstractKernel, x, y; θ) = [kernel(xᵢ, yᵢ; θ) for xᵢ in x, yᵢ in y]

# struct OU <:AbstractKernel 
    
#     distance::Metric

# end

# OU() = OU(Distances.Euclidean())


# function (kernel::OU)(x, y; θ) 

#     d = evaluate(kernel.distance, x, y)

#     θ[1]^2*exp(-d /  θ[2]^2)

# end

# numparams(kernel::OU) = 2
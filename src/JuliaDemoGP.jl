module JuliaDemoGP

    using LinearAlgebra, Distances, Distributions, RecipesBase  

    include("kernels.jl") # rbf and ou kernel

    include("gp.jl") # vanilla gp implementation

    include("plotextension.jl") # allows use of Plot.jl on own gp implementation

    include("toydata.jl") # synthetic data for demonstrating gp fitting

    export GP, loglikelihood, numparams
    export RBF, evaluatekernel , calculatecovariance, toydata

end

abstract type AbstractGP end

struct GP{T1, T2<:AbstractKernel} <:AbstractGP
    x::T1
    y::T1
    kernel::T2
end


function GP(;x = x, y = y, kernel = kernel)
    GP(x, y, kernel)
end


function (gp::GP)(params)
    
    θ, σ = params[1:numparams(gp.kernel)], params[end]

    K = calculatecovariance(gp.kernel, gp.x, gp.x, θ) + σ^2*I + 1e-8*I # add jitter
    
    MvNormal(zeros(length(gp.x)), K)
    
end

numparams(gp::GP) = numparams(gp.kernel) + 1

loglikelihood(gp::GP, params) = logpdf(gp(params), gp.y)


function (gp::GP)(params, xtest)

    θ, σ = params[1:2], params[3]

    Kxx = calculatecovariance(gp.kernel, gp.x, gp.x, θ) + σ^2*I + 1e-8*I # add jitter

    Kx⭑x = calculatecovariance(gp.kernel, xtest, gp.x, θ)

    Kx⭑x⭑ = calculatecovariance(gp.kernel, xtest, xtest, θ)

    μpred = Kx⭑x * (Kxx \ gp.y)
    
    Σpred =  Symmetric(Kx⭑x⭑ - Kx⭑x * (Kxx \ Kx⭑x')) + 1e-8*I

    MvNormal(μpred, Σpred)

end


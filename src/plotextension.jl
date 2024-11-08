@recipe function f(gp::GP, params, xtest)

    predictivenormal = gp(params, xtest)

    linecolor   --> :blue
    seriestype  :=  :path
    ribbon      --> sqrt.(diag(cov(predictivenormal))) # confidence interval
    
    xtest, mean(predictivenormal)
#     ^              ^
#     |              |__ values for y-axis
#     |
#     |__ values for x-axis
end
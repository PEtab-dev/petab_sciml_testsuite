using SafeTestsets

@safetestset "ML-model import" begin
    include(joinpath(@__DIR__, "ml_import.jl"))
end

@safetestset "SciML problem import" begin
    include(joinpath(@__DIR__, "sciml_problem_import.jl"))
end

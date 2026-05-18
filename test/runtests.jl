using SafeTestsets

@safetestset "Aqua quality check" begin
    include("aqua.jl")
end

@safetestset "ML-model import" begin
    include("ml_import.jl")
end

@safetestset "SciML problem import" begin
    include("sciml_problem_import.jl")
end

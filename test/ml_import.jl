#=
    Verify that ML-import test cases can be generated successfully, and that the
    generated neural network YAML matches the Lux model used to create the test
    values.
=#

using PEtabSciMLTestsuite, PythonCall, Test

function run_py_script(test_case)
    pysrc_parent = joinpath(@__DIR__, "..")
    path_py_script = joinpath(
        @__DIR__, "..", "test_cases", "ml_model_import", test_case, "create_testdata",
        "net.py"
    )
    dir_py_script = dirname(path_py_script)
    sys = pyimport("sys")
    runpy = pyimport("runpy")
    sys."path".insert(0, dir_py_script)
    sys."path".insert(0, pysrc_parent)
    return runpy.run_path(path_py_script, run_name = "__main__")
end

PEtabSciMLTestsuite.create_ml_import_tests()

dir_test_cases = joinpath(@__DIR__, "..", "test_cases", "ml_model_import")
test_cases = filter(s -> startswith(s, r"^[0-9]{3}"), readdir(dir_test_cases))
@testset "Neural network import" begin
    for (i, test_case) in pairs(test_cases)
        if i == 1 || i % 5 == 0
            @info "ML import test-case $i"
        end
        test_case = i > 9 ? "0$(i)" : "00$(i)"
        dir_save = joinpath(@__DIR__, "..", "test_cases", "ml_model_import", test_case)
        py_script = run_py_script(test_case)
        ret = py_script["ml_model_import_$(test_case)"](dir_save)
        @test pyconvert(Int64, ret) == 0
    end
end

#=
    Verify that imported likelihood values for the PEtab-SciML import test cases stay
    close to their established reference values, so nothing is broken in the generating
    code
=#

using PEtabSciMLTestsuite, Test, YAML

const LLH_VALUES = (
    "001" => 33.02909543616718,
    "002" => 33.30638150294612,
    "003" => 68.96494660053902,
    "004" => 33.30435713294598,
    "005" => 33.30638150294739,
    "006" => 33.30638150294612,
    "007" => 33.30638150295205,
    "008" => 33.30638150294612,
    "009" => 33.30435704677708,
    "010" => 33.02883354468138,
    "011" => 33.02909543616718,
    "012" => 33.02909535816728,
    "013" => 33.30638141677723,
    "014" => 33.30638150295139,
    "015" => 68.96501052725615,
    "016" => 33.02909543616718,
    "017" => 33.30638150294612,
    "018" => 33.30435713294598,
    "019" => 33.43447918795498,
    "020" => 33.718984584883955,
    "021" => 33.30638150294946,
    "022" => 33.24511338191844,
    "023" => 33.02909543616718,
    "024" => 33.30638150294612,
    "025" => 33.30435713294598,
    "026" => 33.02909543616718,
    "027" => 33.30638150294612,
    "028" => 33.30435713294598,
    "029" => 33.02909543616718,
    "030" => 33.30638150294612,
    "031" => 33.30435713294598,
    "032" => -22.833608002616536,
    "033" => -32.93800974538559,
    "034" => -29.542539538420627,
    "035" => 33.02909543616718,
    "036" => 33.216151044033474,
    "037" => 33.301256776524845,
    "038" => 68.92240038860878,
    "039" => 69.54936071958483
)

PEtabSciMLTestsuite.create_sciml_problem_import_tests()

@testset "llh hybrid tests" begin
    for (test_case, ref_value) in LLH_VALUES
        path_solutions = joinpath(
            @__DIR__, "..", "test_cases", "sciml_problem_import", test_case,
            "solutions.yaml"
        )
        solutions = YAML.load_file(path_solutions)

        if haskey(solutions, "llh")
            @test solutions["llh"] ≈ ref_value
        elseif haskey(solutions, "log_posterior")
            @test solutions["log_posterior"] ≈ ref_value
        end
    end
end

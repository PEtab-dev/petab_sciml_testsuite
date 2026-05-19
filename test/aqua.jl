using Aqua, PEtabSciMLTestsuite

@testset "Aqua" begin
    Aqua.test_ambiguities(PEtabSciMLTestsuite, recursive = false)
    Aqua.test_undefined_exports(PEtabSciMLTestsuite)
    Aqua.test_unbound_args(PEtabSciMLTestsuite)
    Aqua.test_stale_deps(PEtabSciMLTestsuite)
    Aqua.test_deps_compat(PEtabSciMLTestsuite)
    # Fails on OrdinaryDiffEqVerner even though it should not
    #Aqua.find_persistent_tasks_deps(PEtabSciMLTestsuite)
    Aqua.test_piracies(PEtabSciMLTestsuite)
    Aqua.test_project_extras(PEtabSciMLTestsuite)
end

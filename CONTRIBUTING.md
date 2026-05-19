# Contributing

Contributions to the PEtab SciML test suite are welcome. Please either:

- (Preferred) open a
  [pull request](https://github.com/sebapersson/petab_sciml_testsuite/pulls) (drafts
  welcome) adding one or more test cases.
- Or open an [issue](https://github.com/sebapersson/petab_sciml_testsuite/issues) describing
  the missing coverage.

## Adding a new test case

To add a new test case, create a subdirectory in the relevant suite under `test_cases/`,
named with the next three-digit ID (e.g., `003`). Include a short README describing what the
test covers. Most test files should be generated automatically using utility functions from
this repository’s associated Julia library. We use Julia for its strong SciML ecosystem and
mature tooling for computing reference gradients (high-order finite-difference methods). To
install this Julia library, with Julia ≥1.10, from the root directory of repository start
Julia and run:

```julia
import Pkg; Pkg.instantiate()
```

Which files to add depends on the test type.

For **ML model import tests**, provide both `net.jl` and `net.py` script. The `net.jl`
script should generate the test inputs, ML parameters, expected outputs, and
`solutions.yaml`. The `net.py` script should create the PEtab SciML ML-model YAML file and
checks consistency with the ML model used to produce the Julia reference outputs. This
ensures the case is importable in both Python (e.g., PyTorch/Equinox) and Julia, aligning
with the goal that the PEtab SciML YAML is exchangeable across ecosystems. An example can be
found
[here](https://github.com/sebapersson/petab_sciml_testsuite/tree/main/test_cases/net_import/001).

For **PEtab SciML import problem tests**, provide a `create.jl` script. It should generate
the PEtab problem files and the reference values. For the PEtab problem files, the mapping
and hybridisation PEtab tables must be provided manually, the other components can be
selected from predefined assets (`assets/` for SBML models, ML-model YAMLs, ML parameters,
and array inputs) and defaults in `src/` (new values can be added if needed). For the
reference values, include an `llh_id` that maps to a likelihood implementation in
`src/test_values/nllh/`. Because these SciML problems are not analytically solvable, the
likelihood must be implemented explicitly. An example can be found
[here](https://github.com/sebapersson/petab_sciml_testsuite/tree/main/test_cases/hybrid/001).

**Initialization tests** are specified similarly to PEtab SciML import problem.

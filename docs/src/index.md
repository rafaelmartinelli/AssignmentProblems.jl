```@meta
CurrentModule = AssignmentProblems
```

# AssignmentProblems.jl

AssignmentProblems.jl is a lightweight utility for loading Generalized
Assignment Problem (GAP) instances. It ships with the classical benchmark
library and can parse custom files that follow the OR-Library format.

## Installation

AssignmentProblems is not yet registered. Install it directly from GitHub
using Julia's package manager:

```julia
pkg> add https://github.com/rafaelmartinelli/AssignmentProblems.jl
```

## Quick start

```julia
julia> using AssignmentProblems

julia> problem = loadAssignmentProblem(:a05100)
GAP Data a05100 (5 agents, 100 jobs) [-Inf, Inf]

julia> (na(problem), nj(problem))
(5, 100)
```

Supply a file path instead of a symbol to read external instances, and pass
`:Max` as the optional second argument to work with maximisation bounds.

## Next steps

- Learn more about the bundled benchmarks in the [Instance catalogue](@ref
  instance-catalogue).
- Browse the exported types and functions in the [API reference](@ref
  reference).

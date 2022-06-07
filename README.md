# AssignmentProblems.jl

[![Build Status](https://github.com/rafaelmartinelli/AssignmentProblems.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/AssignmentProblems.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/AssignmentProblems.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/AssignmentProblems.jl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

AssignmentProblems reads data files in `gap` format for Generalized Assignmnent Problem (GAP) instances.

## Usage

The main type used by the package is `AssignmentProblem`, defined as follows:

```julia
struct AssignmentProblem
    name   ::String           # Instance name
    agents ::Vector{GAPAgent} # Vector of Agents
    jobs   ::Vector{GAPJob}   # Vector of Jobs

    lb     ::Int64            # Lower bound (typemin(Int64) if not known)
    ub     ::Int64            # Upper bound (typemax(Int64) if not known)
end

struct AssignmentProblem
    name::String                # Instance name

    agents::Vector{Int64}       # Vector of agents (sequential)
    jobs::Vector{Int64}         # Vector of jobs (sequential)

    capacities::Vector{Int64}   # Agents' capacities
    costs::Matrix{Int64}        # Assigments costs (agents x jobs)
    consumptions::Matrix{Int64} # Assigments consumptions (agents x jobs)

    lb::Int64                   # Lower bound (typemin(Int64) if not known)
    ub::Int64                   # Upper bound (typemax(Int64) if not known)
end
```

Some classical GAP instances from the literature are preloaded. For example, to load GAP instance `a05100`:

```julia
data = loadAssignmentProblem(:a05100)
```

See the [full list](https://github.com/rafaelmartinelli/AssignmentProblems.jl/tree/main/data).

AssignmentProblems also loads custom GAP instances (following [ORLib format](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/gapinfo.html)):

```julia
data = loadAssignmentProblem("/path/to/your/GAP/instance.txt")
```

## Installation

AssignmentProblems is *not* yet a registered Julia Package.
You can install AssignmentProblems through the Julia package manager.
Open Julia's interactive session (REPL) and type:

```julia
] add https://github.com/rafaelmartinelli/AssignmentProblems.jl
```

## Related links

- [Mutsunori Yagiura's GAP Page](http://www.al.cm.is.nagoya-u.ac.jp/~yagiura/gap/)
- [ORLib's GAP page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/gapinfo.html)

## Other packages

- [Knapsacks.jl](https://github.com/rafaelmartinelli/Knapsacks.jl): Knapsack algorithms in Julia
- [FacilityLocationProblems.jl](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl): Facility Location Problem Lib 
- [BPPLib.jl](https://github.com/rafaelmartinelli/BPPLib.jl): Bin Packing and Cutting Stock Lib
- [CARPData.jl](https://github.com/rafaelmartinelli/CARPData.jl): Capacitated Arc Routing Problem Lib

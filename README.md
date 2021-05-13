# GAPLib.jl

[![Build Status](https://github.com/rafaelmartinelli/GAPLib.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/GAPLib.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/GAPLib.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/GAPLib.jl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

GAPLib reads data files in `gap` format for Generalized Assignmnent Problem (GAP) instances.

## Usage

The main type used by the package is `GAPData`, defined as follows:

```julia
struct GAPData
    name   ::String           # Instance name
    agents ::Vector{GAPAgent} # Vector of Agents
    jobs   ::Vector{GAPJob}   # Vector of Jobs

    lb     ::Int64            # Lower bound (typemin(Int64) if not known)
    ub     ::Int64            # Upper bound (typemax(Int64) if not known)
end
```

Type `GAPAgent` is defined as follows:

```julia
struct GAPAgent
    id::Int64                  # Sequential agent ID
    capacity::Int64            # Agent capacity
    costs::Vector{Int64}       # List of jobs costs for this agent
    consumption::Vector{Int64} # List of jobs consumptions for this agent
end
```

Type `GAPJob` is defined as follows:

```julia
struct GAPJob
    id::Int64                  # Sequential job ID
    costs::Vector{Int64}       # List of agents costs for this job
    consumption::Vector{Int64} # List of agents consumptions for this job
end
```
So, `costs` and `consumptions` are duplicated in both types.

Some classical GAP instances from the literature are preloaded. For example, to load GAP instance `a05100`:

```julia
data = loadGAP(:a05100)
```

See the [full list](https://github.com/rafaelmartinelli/GAPLib.jl/tree/main/data).

GAPLib also loads custom GAP instances (following [ORLib format](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/gapinfo.html)):

```julia
data = loadGAP("/path/to/your/GAP/instance.txt")
```

## Installation

GAPLib is *not* a registered Julia Package.
You can install GAPLib through the Julia package manager.
Open Julia's interactive session (REPL) and type:

```julia
] add https://github.com/rafaelmartinelli/GAPLib.jl
```

## Related links

- [Mutsunori Yagiura's GAP Page](http://www.al.cm.is.nagoya-u.ac.jp/~yagiura/gap/)
- [ORLib's GAP page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/gapinfo.html)

## Other packages:

- [KnapsackLib.jl](https://github.com/rafaelmartinelli/KnapsackLib.jl): Knapsack algorithms in Julia
- [BPPLib.jl](https://github.com/rafaelmartinelli/BPPLib.jl): Bin Packing and Cutting Stock Lib
- [CARPData.jl](https://github.com/rafaelmartinelli/CARPData.jl): Capacitated Arc Routing Problem Lib

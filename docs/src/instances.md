```@meta
CurrentModule = AssignmentProblems
```

# Instance catalogue

```@id instance-catalogue
```

The package bundles the classical Generalized Assignment Problem benchmarks as
ZIP archives under the `data/` directory. Each file is exposed through the
[`Instance`](@ref) enumeration, enabling programmatic discovery and loading.

## Listing the available instances

Use the `instances` helper from Julia's `Base.Enums` to iterate over every
identifier:

```@example
using AssignmentProblems
collect(instances(Instance))[1:5]
```

The enumeration is grouped according to the original literature (families `a`
through `e`). The suffix hints at the problem size, e.g. `a05100` stands for an
instance with 5 agents and 100 jobs.

## Loading data files

Every enumerated value corresponds to a ZIP archive. When you call
[`loadAssignmentProblem`](@ref) with an `Instance` symbol, the archive is read
and converted into an [`AssignmentProblem`](@ref).

To work with files outside of the bundled catalogue, pass a file path instead.
The loader accepts raw text files as well as single-entry ZIP archives that
follow the OR-Library specification.

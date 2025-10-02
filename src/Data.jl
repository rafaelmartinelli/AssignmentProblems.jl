"""
    AssignmentProblem

Container for a Generalized Assignment Problem (GAP) instance.

# Fields
- `name::String`: Identifier for the instance, usually matching the source
  file name.
- `capacities::Vector{Int64}`: Capacity available for each agent.
- `costs::Matrix{Int64}`: Assignment costs arranged as agents × jobs.
- `consumptions::Matrix{Int64}`: Resource consumption for each
  agent/job combination.
- `lb::Int64`: Known lower bound for the configured objective direction, or
  `typemin(Int64)` if no bound is published.
- `ub::Int64`: Known upper bound for the configured objective direction, or
  `typemax(Int64)` if no bound is published.
"""
struct AssignmentProblem
    name::String

    capacities::Vector{Int64}
    costs::Matrix{Int64}
    consumptions::Matrix{Int64}

    lb::Int64
    ub::Int64
end

"""
    na(problem::AssignmentProblem) -> Int

Return the number of agents encoded in `problem`.
"""
na(data::AssignmentProblem) = length(data.capacities)

"""
    nj(problem::AssignmentProblem) -> Int

Return the number of jobs encoded in `problem`.
"""
nj(data::AssignmentProblem) = size(data.costs, 2)

function Base.show(io::IO, data::AssignmentProblem)
    print(io, "GAP Data $(data.name)")
    print(io, " ($(na(data)) agents,")
    print(io, " $(nj(data)) jobs)")
    if data.lb != typemin(Int64)
        print(io, " [$(data.lb),")
    else
        print(io, " [-Inf,")
    end
    if data.ub != typemax(Int64)
        print(io, " $(data.ub)]")
    else
        print(io, " Inf]")
    end
end

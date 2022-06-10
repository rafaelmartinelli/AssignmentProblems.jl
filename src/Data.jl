struct AssignmentProblem
    name::String

    capacities::Vector{Int64}
    costs::Matrix{Int64}
    consumptions::Matrix{Int64}

    lb::Int64
    ub::Int64
end

na(data::AssignmentProblem) = length(data.capacities)
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

struct AssignmentProblem
    name::String

    agents::Vector{Int64}
    jobs::Vector{Int64}

    capacities::Vector{Int64}
    costs::Matrix{Int64}
    consumptions::Matrix{Int64}

    lb::Int64
    ub::Int64
end

function Base.show(io::IO, data::AssignmentProblem)
    print(io, "GAP Data $(data.name)")
    print(io, " ($(length(data.agents)) agents,")
    print(io, " $(length(data.jobs)) jobs)")
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

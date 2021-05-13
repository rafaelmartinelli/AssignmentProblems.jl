struct GAPAgent
    id::Int64
    capacity::Int64
    costs::Vector{Int64}
    consumption::Vector{Int64}
end

function Base.show(io::IO, agent::GAPAgent)
    print(io, "A($(agent.id))")
end

struct GAPJob
    id::Int64
    costs::Vector{Int64}
    consumption::Vector{Int64}
end

function Base.show(io::IO, job::GAPJob)
    print(io, "J($(job.id))")
end

struct GAPData
    name::String
    agents::Vector{GAPAgent}
    jobs::Vector{GAPJob}

    lb::Int64
    ub::Int64
end

function Base.show(io::IO, data::GAPData)
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

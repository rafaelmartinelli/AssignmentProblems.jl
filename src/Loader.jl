function loadAssignmentProblem(instance::Symbol, objective::Symbol = :Min)
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1]
    file = ZipFile.Reader(file_name)
    values = parse.(Int64, split(read(file.files[1], String)))
    close(file)

    return load(values, name, objective)
end

function loadAssignmentProblem(file_name::String, objective::Symbol = :Min)
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1]
    values = parse.(Int64, split(read(file_name, String)))

    return load(values, name, objective)
end

function load(values::Array{Int64}, name::String, objective::Symbol)
    n_agents = values[1]
    n_jobs = values[2]

    counter = 3

    costs = zeros(Int64, n_agents, n_jobs)
    for i in 1:n_agents
        costs[i, :] = values[counter:counter + n_jobs - 1]
        counter += n_jobs
    end

    consumptions = zeros(Int64, n_agents, n_jobs)
    for i in 1:n_agents
        consumptions[i, :] = values[counter:counter + n_jobs - 1]
        counter += n_jobs
    end

    capacities = values[counter:counter + n_agents - 1]

    return AssignmentProblem(name, capacities, costs, consumptions, loadBounds(name, objective)...)
end

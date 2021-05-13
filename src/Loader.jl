function loadGAP(instance::Symbol)
    file_name = joinpath(data_path, string(instance))
    return loadGAP(file_name)
end

function loadGAP(file_name::String)
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1]
    values = parse.(Int64, split(read(file_name, String)))

    m = values[1]
    n = values[2]

    counter = 3

    costs = zeros(Int64, n, m)
    for j in 1:m
        costs[:, j] = values[counter:counter + n - 1]
        counter += n
    end

    consumptions = zeros(Int64, n, m)
    for j in 1:m
        consumptions[:, j] = values[counter:counter + n - 1]
        counter += n
    end

    capacities = values[counter:counter + m - 1]

    agents = [ GAPAgent(j, capacities[j], costs[:, j], consumptions[:, j]) for j in 1:m ]
    jobs = [ GAPJob(i, costs[i, :], consumptions[i, :]) for i in 1:n ]

    return GAPData(name, agents, jobs, typemin(Int64), typemax(Int64))
end

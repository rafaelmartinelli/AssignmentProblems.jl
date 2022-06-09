using Printf

function splitFiles(file_name::String)
    values = parse.(Int64, split(read(file_name, String)))

    total = values[1]
    counter = 2
    for i in 1:total   
        n_agents = values[counter]
        n_jobs = values[counter + 1]

        out_file = @sprintf "data/c%02d%d_%d" n_agents n_jobs i
        out = open(out_file, "w")

        @printf out "%d %d\n" n_agents n_jobs

        counter += 2

        for i in 1:n_agents
            for pos in counter:counter + n_jobs - 1
                @printf out "%d " values[pos]
            end
            @printf out "\n"
            counter += n_jobs
        end

        for i in 1:n_agents
            for pos in counter:counter + n_jobs - 1
                @printf out "%d " values[pos]
            end
            @printf out "\n"
            counter += n_jobs
        end

        for pos in counter:counter + n_agents - 1
            @printf out "%d " values[pos]
        end
        @printf out "\n"
        counter += n_agents

        close(out)
    end
end

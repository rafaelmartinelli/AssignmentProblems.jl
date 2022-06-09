function loadBounds(name::String)
    file_name = joinpath(data_path, "bounds.txt")
    values = split(read(file_name, String))

    index = findfirst(isequal(name), values)
    if index !== nothing
        return parse(Float64, values[index + 1]), parse(Float64, values[index + 2])
    else
        return typemin(Int64), typemax(Int64)
    end
end

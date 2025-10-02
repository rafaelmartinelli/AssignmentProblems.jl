"""
    AssignmentProblems

Utilities for reading benchmark instances of the Generalized Assignment
Problem (GAP). The module exports helpers to access the bundled data set
collection, parse custom files that follow the OR-Library GAP format, and
inspect the resulting `AssignmentProblem` structures.
"""
module AssignmentProblems

export AssignmentProblem, loadAssignmentProblem
export na, nj

const data_path = joinpath(pkgdir(AssignmentProblems), "data")

using ZipFile

include("Data.jl")
include("Util.jl")
include("Loader.jl")
include("Enums.jl")

for inst in instances(Instance)
    @eval export $(Symbol(inst))
end

for obj in instances(Objective)
    @eval export $(Symbol(obj))
end

end

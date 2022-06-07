module AssignmentProblems

export AssignmentProblem, loadAssignmentProblem

const data_path = joinpath(pkgdir(AssignmentProblems), "data")

using ZipFile

include("Data.jl")
include("Loader.jl")

end

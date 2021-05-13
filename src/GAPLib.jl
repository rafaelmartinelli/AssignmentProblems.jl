module GAPLib

export GAPData, GAPAgent, GAPJob, loadGAP

const data_path = joinpath(pkgdir(GAPLib), "data")

include("Data.jl")
include("Loader.jl")

end

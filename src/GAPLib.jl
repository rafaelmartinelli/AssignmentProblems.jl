module GAPLib

export GAPData, GAPAgent, GAPJob, loadGAP

const data_path = joinpath(pkgdir(GAPLib), "data")

using ZipFile

include("Data.jl")
include("Loader.jl")

end

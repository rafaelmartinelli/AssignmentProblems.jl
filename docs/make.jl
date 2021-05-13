using GAPLib
using Documenter

DocMeta.setdocmeta!(GAPLib, :DocTestSetup, :(using GAPLib); recursive=true)

makedocs(;
    modules=[GAPLib],
    authors="Rafael Martinelli",
    repo="https://github.com/rafaelmartinelli/GAPLib.jl/blob/{commit}{path}#{line}",
    sitename="GAPLib.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://rafaelmartinelli.github.io/GAPLib.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/rafaelmartinelli/GAPLib.jl",
)

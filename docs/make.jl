using AssignmentProblems
using Documenter

DocMeta.setdocmeta!(AssignmentProblems, :DocTestSetup, :(using AssignmentProblems); recursive=true)

makedocs(;
    modules=[AssignmentProblems],
    authors="Rafael Martinelli",
    repo="https://github.com/rafaelmartinelli/AssignmentProblems.jl/blob/{commit}{path}#{line}",
    sitename="AssignmentProblems.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://rafaelmartinelli.github.io/AssignmentProblems.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/rafaelmartinelli/AssignmentProblems.jl",
)

using AssignmentProblems
using Test

@testset "LoadSymbol" begin
    data = loadAssignmentProblem(:a05200)
    @test data.name == "a05200"
    @test data.capacities[3] == 671
    @test length(data.agents) == 5
    @test length(data.jobs) == 200
    @test data.lb == typemin(Int64)
    @test data.ub == typemax(Int64)
    @test_nowarn println(data)
end

@testset "ErrorSymbol" begin
    data = loadAssignmentProblem(:notaninstance)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadAssignmentProblem(joinpath(pkgdir(AssignmentProblems), "test/data/a05100"))
    @test data.name == "a05100"
    @test data.capacities[3] == 342
    @test length(data.agents) == 5
    @test length(data.jobs) == 100
    @test data.lb == typemin(Int64)
    @test data.ub == typemax(Int64)
    @test_nowarn println(data)
end

@testset "ErrorString" begin
    data = loadAssignmentProblem("notaninstance")
    @test data === nothing
end

@testset "TestBounds" begin
    data = loadAssignmentProblem(:c1060_5)
    @test data.name == "c1060_5"
    @test data.lb == 1446
    @test data.ub == 1446
end

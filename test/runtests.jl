using AssignmentProblems
using Test

@testset "LoadSymbol" begin
    data = loadAssignmentProblem(:a05200)
    @test data.name == "a05200"
    @test data.capacities[3] == 671
    @test na(data) == 5
    @test nj(data) == 200
    @test_nowarn println(data)
end

@testset "ErrorSymbol" begin
    data = loadAssignmentProblem(:notaninstance)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadAssignmentProblem(joinpath(pkgdir(AssignmentProblems), "test/data/dummy"))
    @test data.name == "dummy"
    @test data.capacities[2] == 342
    @test na(data) == 2
    @test nj(data) == 5
    @test data.lb == typemin(Int64)
    @test data.ub == typemax(Int64)
    @test_nowarn println(data)
end

@testset "ErrorString" begin
    data = loadAssignmentProblem("notaninstance")
    @test data === nothing
end

@testset "TestBounds" begin
    data = loadAssignmentProblem(:c801600, :Max)
    @test data.name == "c801600"
    @test data.lb == 79733
    @test data.ub == 79740
    @test_nowarn println(data)
end

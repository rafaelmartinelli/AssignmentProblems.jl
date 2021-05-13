using GAPLib
using Test

@testset "LoadSymbol" begin
    data = loadGAP(:a05200)
    @test data.name == "a05200"
    @test data.agents[3].capacity == 671
    @test length(data.agents) == 5
    @test length(data.jobs) == 200
    @test data.lb == typemin(Int64)
    @test data.ub == typemax(Int64)
    @test_nowarn println(data)
    @test_nowarn println(data.agents[1])
    @test_nowarn println(data.jobs[1])
end

@testset "ErrorSymbol" begin
    data = loadGAP(:notaninstance)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadGAP(joinpath(pkgdir(GAPLib), "test/data/a05100"))
    @test data.name == "a05100"
    @test data.agents[3].capacity == 342
    @test length(data.agents) == 5
    @test length(data.jobs) == 100
    @test data.lb == typemin(Int64)
    @test data.ub == typemax(Int64)
    @test_nowarn println(data)
end

@testset "ErrorString" begin
    data = loadGAP("notaninstance")
    @test data === nothing
end

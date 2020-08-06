#=
test_operations:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

module TestOperations
    # packages
    using Test

    # extarnal modules
    include("add.jl")
    include("divide.jl")
    include("multiply.jl")
    include("subtract.jl")

    # method
    function test()
        @testset "Operations" begin
            @testset "Add" begin
                @test Add.add(10, 4) == 14
                @test Add.add(30, -12) == 18
            end
            @testset "Division" begin
                @test Division.divide(75, 5) == 15
                @test Division.divide(36, -6) == -6
            end
            @testset "Multiplication" begin
                @test Multiplication.multiply(12, 12) == 144
                @test Multiplication.multiply(0, 155) == 0
            end
            @testset "Subtraction" begin
                @test Subtraction.subtract(12, 100) == -88
                @test Subtraction.subtract(196, 78) == 118
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using. TestOperations
    TestOperations.test()
end

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
                @test_nowarn Add.main()
            end
            @testset "Division" begin
                @test_nowarn Division.main()
            end
            @testset "Multiplication" begin
                @test_nowarn Multiplication.main()
            end
            @testset "Subtraction" begin
                @test_nowarn Subtraction.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using. TestOperations
    TestOperations.test()
end

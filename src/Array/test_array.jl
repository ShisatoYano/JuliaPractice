#=
test_array:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-11
=#

module TestArray
    # packages
    using Test

    # external modules
    include("array_initialization.jl")
    include("array_operation.jl")

    # methods
    function test()
        @testset "Array" begin
            @testset "ArrayInit" begin
                @test_nowarn ArrayInit.main()
            end
            @testset "ArrayOp" begin
                @test_nowarn ArrayOp.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestArray
    TestArray.test()
end

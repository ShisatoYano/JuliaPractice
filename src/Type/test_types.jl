#=
test_types:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module TestTypes
    # packages
    using Test

    # external packages
    include("composite_types.jl")
    include("union_types.jl")
    include("parametric_types.jl")

    # methods
    function test()
        @testset "Type" begin
            @testset "ComposTypes" begin
                @test_nowarn ComposTypes.main()
            end
            @testset "UnionTypes" begin
                @test_nowarn UnionTypes.main()
            end
            @testset "Parametric" begin
                @test_nowarn Parametric.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestTypes
    TestTypes.test()
end
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
                p = ComposTypes.Point(3, 5)
                p_mut = ComposTypes.PointMut(3, 5)
                p_mut.x = 10
                p_mut.y = 20
                @test p.x == 3
                @test p.y == 5
                @test_throws ErrorException p.x = 4
                @test_throws ErrorException p.y = -23
                @test ComposTypes.get_distance(p) == 5.830951894845301
                @test p_mut.x == 10
                @test p_mut.y == 20
            end
            @testset "UnionTypes" begin
                @test UnionTypes.get_union_type(10) == Int64
                @test UnionTypes.get_union_type("Julia") == String
            end
            @testset "Parametric" begin
                p_int = Parametric.Point(5, 10)
                p_float = Parametric.Point(5.3, 10.9)
                @test Parametric.get_x_type(p_int) == Int64
                @test Parametric.get_x_type(p_float) == Float64
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestTypes
    TestTypes.test()
end
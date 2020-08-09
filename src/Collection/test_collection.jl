#=
test_collection:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module TestCollection
    # packages
    using Test

    # external modules
    include("tuple.jl")
    include("list.jl")
    include("set.jl")
    include("dictionary.jl")

    # methods
    function test()
        @testset "Collection" begin
            @testset "Tuple" begin
                @test isempty(Tuple.t) == false
                @test isempty(Tuple.t_n) == false
                @test_throws BoundsError Tuple.get_val(Tuple.t, 4)
                @test_throws ErrorException Tuple.t_n[:d]
                @test_nowarn Tuple.main()
            end
            @testset "List" begin
                @test isempty(List.list_empty) == true
                @test isempty(List.list) == false
                @test_nowarn List.main()
            end
            @testset "Dictionary" begin
                @test_nowarn Dictionary.main()
            end
            @testset "Set" begin
                @test_nowarn SetModule.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestCollection
    TestCollection.test()
end

#=
test_df:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-14
=#

module TestDf
    # packages
    using Test

    # external modules
    include("create_df.jl")
    include("operate_df.jl")

    # methods
    function test()
        @testset "DataFrames" begin
            @testset "DfCreator" begin
                @test_nowarn DfCreator.main()
            end
            @testset "DfOperator" begin
                @test_nowarn DfOperator.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestDf
    TestDf.test()
end
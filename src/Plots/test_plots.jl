#=
test_plots:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-12
=#

module TestPlots
    # packages
    using Test

    # external modules
    include("plots_2d.jl")

    # methods
    function test()
        @testset "Plots" begin
            @testset "Plots2D" begin
                @test_nowarn Plots2D.main(false)
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestPlots
    TestPlots.test()
end

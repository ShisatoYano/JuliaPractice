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
    include("plots_3d.jl")
    include("subplot_2d.jl")
    include("animation_2d.jl")

    # methods
    function test()
        @testset "Plots" begin
            @testset "Plots2D" begin
                Plots2D.set_show_plot(false)
                @test_nowarn Plots2D.main()
            end
            @testset "Plots3D" begin
                Plots3D.set_show_plot(false)
                @test_nowarn Plots3D.main()
            end
            @testset "SubPlot2D" begin
                SubPlot2D.set_show_plot(false)
                @test_nowarn SubPlot2D.main()
            end
            @testset "Anime2D" begin
                Anime2D.set_show_plot(false)
                @test_nowarn Anime2D.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestPlots
    TestPlots.test()
end

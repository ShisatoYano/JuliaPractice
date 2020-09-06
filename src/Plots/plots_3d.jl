#=
plot_3d:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-12
=#

module Plots3D
    # packages
    using PyPlot: plt
    using PyCall
    @pyimport mpl_toolkits.mplot3d as mpl3

    # flag to switch show or not
    show_plot = true

    # methods
    function set_show_plot(flag)
        global show_plot = flag
    end

    function plot_point_3d()
        x = randn(100)
        y = randn(100)
        z = randn(100)
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1, projection="3d")
        ax.plot(x, y, z, "o", color="r", ms=8)
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_zlabel("Z")
        ax.set_title("3D Point Plot Sample")
        ax.grid(true)
    end

    function plot_line_3d()
        x = 1:5
        y = 1:5
        z = 1:5
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1, projection="3d")
        ax.plot(x, y, z, "o-", color="r", ms=5)
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_zlabel("Z")
        ax.set_title("3D Line Plot Sample")
        ax.grid(true)
    end

    function main()
        plot_point_3d()
        plot_line_3d()
        if show_plot == true
            plt.show()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Plots3D
    Plots3D.main()
end


#=
animation_2d:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-12
=#

module Anime2D
    # packages
    using PyCall
    @pyimport matplotlib.pyplot as plt

    # flag to switch show or not
    show_plot = true

    # methods
    function set_show_plot(flag)
        show_plot = flag
    end

    function main()
        # data
        x = range(0, 2pi, length=100)
        y = sin.(x)

        # figure
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        pxy, = ax.plot([], [], ".", c="b", ms=10)
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_xlim([0.0, 7.0])
        ax.set_ylim([-1.0, 1.0])
        ax.grid(true)

        # animation
        for i in 1:length(x)
            if show_plot == true
                pxy.set_data(x[1:i], y[1:i])
                plt.pause(0.001)
            end
        end

        if show_plot == true
            plt.show()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Anime2D
    Anime2D.main()
end

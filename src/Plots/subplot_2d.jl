#=
subplot_2d:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-12
=#

module SubPlot2D
    # packages
    using PyCall
    @pyimport matplotlib.pyplot as plt

    # flag to switch show or not
    show_plot = true

    # methods
    function set_show_plot(flag)
        global show_plot = flag
    end

    function plot_subplot()
        x = range(-2, 2, length=100)
        fig = plt.figure()
        for i in 1:6
            ax = fig.add_subplot(2, 3, i)
            ax.plot(x, x.^i, "-", c="c", ms=10)
            ax.set_xlabel("X")
            ax.set_ylabel("Y")
            ax.set_title("\$y = x^$(i)\$")
            ax.grid(true)
        end
        fig.tight_layout()
    end

    function main()
        plot_subplot()
        if show_plot == true
            plt.show()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .SubPlot2D
    SubPlot2D.main()
end
#=
plots_2d:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-12
=#

module Plots2D
    # packages
    using PyCall
    @pyimport matplotlib.pyplot as plt

    # flag to switch show or not
    show_plot = true

    function set_show_plot(flag)
        global show_plot = flag
    end

    # method
    function plot_line()
        x = range(0, 2pi, length=100)
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        ax.plot(x, sin.(x), "-", c="b", ms=10)
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_title("2D Line Plot Sample")
        ax.grid(true)
    end

    function plot_point()
        x = range(0, 2pi, length=100)
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        ax.plot(x, cos.(x), ".", c="b", ms=10)
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_title("2D Point Plot Sample")
        ax.grid(true)
    end

    function plot_over()
        x = range(0, 2pi, length=100)
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        ax.plot(x, sin.(x), "-", c="b", ms=10, label="sin")
        ax.plot(x, cos.(x), ".", c="r", ms=10, label="cos")
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_title("2D Over Plot Sample")
        ax.grid(true)
        ax.legend()
    end

    function plot_scatter()
        x = rand(100)
        y = x.^2 + randn(100).* abs.(x) * 0.5
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        ax.scatter(x, y, marker="*", s=13)
        ax.set_xlabel("X")
        ax.set_ylabel("Y")
        ax.set_title("2D Scatter Sample")
        ax.grid(true)
    end

    function plot_histogram()
        x = vcat(randn(100), 2 * randn(100).+ 4)
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        ax.hist(x, bins=30, color="g")
        ax.set_title("Histgram Sample")
        ax.grid(true)
    end

    function plot_pie_chart()
        x = 10:10:40
        labels = ["A", "B", "C", "D"]
        colors = ["r", "g", "b", "m"]
        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)
        ax.pie(x, labels=labels, colors=colors, autopct="%1.1f%%", counterclock=true, startangle=90)
        ax.legend(labels, fontsize=12, loc=1)
        ax.set_title("Pie Chart Sample")
    end

    function main()
        plot_line()
        plot_point()
        plot_over()
        plot_scatter()
        plot_histogram()
        plot_pie_chart()
        if show_plot == true
            plt.show()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Plots2D
    Plots2D.main(true)
end

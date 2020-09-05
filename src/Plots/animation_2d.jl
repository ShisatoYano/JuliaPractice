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
    @pyimport PIL.Image as Image

    # flag to switch show or not
    show_plot = true

    # methods
    function set_show_plot(flag)
        global show_plot = flag
    end

    function create_gif(im_num)
        images = []
        if im_num > 0
            for num in 1:im_num
                im_name = string(num, ".png")
                im = Image.open(im_name)
                push!(images, im)
            end
            images[1].save("animation_2d_sample.gif",
                            save_all=true,
                            append_images=images[1:end],
                            loop=0,
                            duration=60)
        end
    end

    function delete_png(im_num)
        if im_num > 0
            for num in 1:im_num
                im_name = string(num, ".png")
                rm(im_name)
            end
        end
    end

    function main()
        # data
        x = range(0, 2pi, length=100)
        y = sin.(x)

        im_num = 0

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
                im_num += 1
                plt.savefig(string(im_num, ".png"))
                plt.pause(0.001)
            end
        end

        create_gif(im_num)

        delete_png(im_num)

        if show_plot == true
            plt.show()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Anime2D
    Anime2D.main()
end

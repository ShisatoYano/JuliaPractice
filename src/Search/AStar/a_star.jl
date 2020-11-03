#=
a_star:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-11-02
=#
module AStar
    function search(start)

    end

    function main()
        # inital board
        start = [8, 6, 7, 2, 5, 4, 3, 0, 1]

        # searching by A* algorithm
        @time search(start)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .AStar
    as = AStar
    as.main()
end
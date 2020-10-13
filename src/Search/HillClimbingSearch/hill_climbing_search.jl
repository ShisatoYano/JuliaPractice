#=
hill_climbing_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-13

Goal is as top of mountain.
Searching to climbing direction.
Cost(distance to Goal) need to be calculated.
Evaluated by Manhattan distance.
=#

module HCS
    # adjacent list
    const adjacent = (
        (2, 4),
        (1, 3, 5)
    )

    function main()
        board = [9, 7, 8, 3, 6, 5, 4, 1, 2]

        println(adjacent)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .HCS
    HCS.main()
end
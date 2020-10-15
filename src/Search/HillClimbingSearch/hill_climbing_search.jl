#=
hill_climbing_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-13

Goal is as top of mountain.
Searching to climbing direction.
Cost(distance to Goal) need to be calculated.
Evaluated by Manhattan distance.

Board as 8 puzzle
0 1 2
3 4 5
6 7 8
=#

module HCS
    # adjacent node
    const adjacent = (
        (1, 3),       # 0
        (0, 2, 4),    # 1
        (1, 5),       # 2
        (0, 4, 6),    # 3
        (1, 3, 5, 7), # 4
        (2, 4, 8),    # 5
        (3, 7),       # 6
        (4, 6, 8),    # 7
        (5, 7)        # 8
    )

    # distance to other nodes
    const distance = (
        (),
        (0, 1, 2, 1, 2, 3, 2, 3, 4), # 1
        (1, 0, 1, 2, 1, 2, 3, 2, 3), # 2
        (2, 1, 0, 3, 2, 1, 4, 3, 2), # 3
        (1, 2, 3, 0, 1, 2, 1, 2, 3), # 4
        (2, 1, 2, 1, 0, 1, 2, 1, 2), # 5
        (3, 2, 1, 2, 1, 0, 3, 2, 1), # 6
        (2, 3, 4, 1, 2, 3, 0, 1, 2), # 7
        (3, 2, 3, 2, 1, 2, 1, 0, 1)  # 8
    )

    const goal = [1, 2, 3, 4, 5, 6, 7, 8, 0]

    # distance to goal
    function get_distance(board)
        dist = 0
        for i in 1:9
            panel = board[i]
            if panel != 0
                dist += distance[panel+1][i]
            end
        end
        return dist
    end

    # hill clibming search
    function search(board, space, cost, history)
        if board == goal
            return true
        else
            buffer = []
            for i in adjacent[space]
                panel = board[i+1]
                b_tmp = board # need to copy
                b_tmp[space] = b_tmp[i+1]
                b_tmp[i+1] = 0
                println(panel,"",i)
            end
        end
        return false
    end

    function main()
        # initial board
        b = [8, 6, 7, 2, 5, 4, 3, 0, 1]

        search(b, findall(x->x == 0, b)[1], get_distance(b), [b])
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .HCS
    HCS.main()
end
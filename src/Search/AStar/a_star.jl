#=
a_star:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-11-02

Searching a path to a Goal by A* algorithm
Considering a cost from Start to current state and
a cost to the Goal

Board as 8 puzzle
0 1 2
3 4 5
6 7 8
=#
module AStar
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

    # state of node
    mutable struct State
        board
        space
        prev
        move
        kind
        cost
    end

    # queue
    queue = []

    # move counter
    counter = 0

    # flag of node opening/closing
    const OPEN = 1
    const CLOSE = 0

    # move added node to root
    function upheap(queue, n)
        while true
            # index of parent node
            p = Int(trunc((n - 1)/2))
            if (p < -1) || (queue[p+1].cost <= queue[n+1].cost)
                break
            end
            tmp = queue[n+1]
            queue[n+1] = queue[p+1]
            queue[p+1] = tmp
            n = p
        end
    end

    # move root node to leaf
    function downheap(queue, n)
        len = length(queue)
        while true
            # index of child node
            c = 2 * n + 1
            if c >= len
                break
            end
            # exchange parent node and smaller cost child
            if (c + 1) < len
                if queue[c+1].cost > queue[c+2].cost
                    c += 1
                end
            end
            if queue[n+1].cost <= queue[c+1].cost
                break
            end
            tmp = queue[n+1]
            queue[n+1] = queue[c+1]
            queue[c+1] = tmp
            n = c
        end
    end

    # add data to tail of queue
    # after adding, sort by upheap
    function push(queue, data)
        push!(queue, data)
        upheap(queue, length(queue)-1)
    end

    # get and remove minimum cost node from queue
    function pop(queue)
        min_node = queue[1]
        last_node = queue[end]
        deleteat!(queue, length(queue))
        if length(queue) > 0
            # create heap again
            queue[1] = last_node
            downheap(queue, 0)
        end
        return min_node
    end

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
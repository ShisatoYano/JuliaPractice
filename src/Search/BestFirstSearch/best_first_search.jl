#=
best_first_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-17

Searching to climbing direction based on global state.
Cost(distance to Goal) need to be calculated.
Evaluated by Manhattan distance.

Board as 8 puzzle
0 1 2
3 4 5
6 7 8
=#

module BestFirstSearch
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
        cost
    end

    # queue
    queue = []

    # moves counter
    counter = 0

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

    function set_cost(state)
        if state.prev == nothing
            state.cost = get_distance(state.board)
        else
            panel = state.board[state.prev.space]
            state.cost = state.prev.cost - distance[panel+1][state.space] + distance[panel+1][state.prev.space]
        end
    end

    function get_cost_diff(state_1, state_2)
        return state_1.cost - state_2.cost
    end

    function show_history(state)
        if state != nothing
            show_history(state.prev)
            println("Board:$(state.board) Cost:$(state.cost)")
            global counter += 1
        end
    end

    function search(start)
        # initial state
        init_state = State(start, findall(x->x == 0, start)[1], nothing, 0)
        set_cost(init_state)
        push(queue, init_state)

        # hash table to check same state
        state_table = Dict{Tuple, Bool}()
        state_table[Tuple(start)] = true

        while length(queue) > 0
            min_node = pop(queue)
            for i in adjacent[min_node.space]
                b = [p for p in min_node.board]
                b[min_node.space] = b[i+1]
                b[i+1] = 0
                key = Tuple(b)
                if haskey(state_table, key) == false
                    s = State(b, i+1, min_node, 0)
                    set_cost(s)
                    if b == goal
                        show_history(s)
                        println("Moves count = $(counter)")
                        return
                    end
                    push(queue, s)
                    state_table[key] = true
                end
            end
        end
    end

    function main()
        # initial board
        start = [8, 6, 7, 2, 5, 4, 3, 0, 1]

        # best first search
        @time search(start)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .BestFirstSearch
    bfs = BestFirstSearch
    bfs.main()
end
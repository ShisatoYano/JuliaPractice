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

    # define state
    mutable struct State
        board
        space
        prev
        cost
    end

    # queue
    queue = []

    # add data to tail of queue
    # after adding, sort by upheap
    function push(queue, data)
        push!(queue, data)
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

    function search(start)
        # initial state
        init_state = State(start, findall(x->x == 0, start)[1], nothing, 0)
        set_cost(init_state)
        push(queue, init_state)
    end

    function main()
        # initial board
        start = [8, 6, 7, 2, 5, 4, 3, 0, 1]

        # best first search
        search(start)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .BestFirstSearch
    bfs = BestFirstSearch
    bfs.main()
end
#=
breadth_first_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-02

search the nearest node from a given node

Tree definition
     1
    / \
   2   3
 / \  / \
4  5 6  7
=#

module BFS
    # node class
    mutable struct Node
        val
        left
        right
    end

    function search(root, target)
        # define empty queue
        node_que = []

        # add root node to queue
        push!(node_que, root)

        # iterate search until empty
        while length(node_que) > 0
            # get node from head of queue
            node = node_que[1]
            deleteat!(node_que, 1)

            if node != nothing
                println("Search Node $(node.val)")

                # found target
                if node.val == target
                    return true
                end

                # add child nodes to queue
                push!(node_que, node.left)
                push!(node_que, node.right)
            end
        end

        # not found target
        return false
    end

    function main()
        # difine tree
        root = Node(1, nothing, nothing)
        root.left = Node(2, nothing, nothing)
        root.right = Node(3, nothing, nothing)
        root.left.left = Node(4, nothing, nothing)
        root.left.right = Node(5, nothing, nothing)
        root.right.left = Node(6, nothing, nothing)
        root.right.right = Node(7, nothing, nothing)

        # target node
        target = 4

        # search target node
        result = search(root, target)
        if result == true
            println("Found target node $(target)")
        else
            println("Not found")
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .BFS
    BFS.main()
end
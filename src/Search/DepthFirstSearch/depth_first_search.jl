#=
depth_first_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-06

search node as far as possible

Tree definition
     1
    / \
   2   5
 / \  / \
3  4 6  7
=#

module DFS
    # node class
    mutable struct Node
        val
        left
        right
    end

    function search(root, target)
        # define empty stack
        node_stack = []

        # add root node to stack
        push!(node_stack, root)

        # iterate search until empty
        while length(node_stack) > 0
            # get node from tail of stack
            node = node_stack[end]
            pop!(node_stack)

            if node != nothing
                println("Search Node $(node.val)")

                # found target
                if node.val == target
                    return true
                end

                # add child nodes to stack
                push!(node_stack, node.left)
                push!(node_stack, node.right)
            end
        end
    end

    function main()
        # define tree
        root = Node(1, nothing, nothing)
        root.left = Node(2, nothing, nothing)
        root.right = Node(5, nothing, nothing)
        root.left.left = Node(3, nothing, nothing)
        root.left.right = Node(4, nothing, nothing)
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
    using .DFS
    DFS.main()
end
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

    # result flag
    found = false

    function traverse(node, target)
        if node != nothing
            println(node.val)
            # found target node
            if node.val == target
                global found = true
            end
            # search child node recursively
            if found != true
                traverse(node.left, target)
                traverse(node.right, target)
            end
        end
    end

    function search(root, target)
        traverse(root, target)
    end

    function main()
        # difine tree
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
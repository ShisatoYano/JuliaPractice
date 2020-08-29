#=
binary_tree:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-21

Tree definition
      A
    /  \
   B    H
  / \
 C  D
   / \
  E   F
 /
G
=#

module MyBinaryTree

    # Node class
    mutable struct Node
        label
        right
        left
    end

    function pre_order(node)
        if node == nothing
            return
        end
        println(node.label)
        pre_order(node.left)
        pre_order(node.right)
    end

    function in_order(node)
        if node == nothing
            return
        end
        in_order(node.left)
        println(node.label)
        in_order(node.right)
    end

    function post_order(node)
        if node == nothing
            return
        end
        post_order(node.left)
        post_order(node.right)
        println(node.label)
    end

    function main()
        # define root node
        root = Node('A', nothing, nothing)
        root.left = Node('B', nothing, nothing)
        root.right = Node('H', nothing, nothing)
        root.left.left = Node('C', nothing, nothing)
        root.left.right = Node('D', nothing, nothing)
        root.left.right.left = Node('E', nothing, nothing)
        root.left.right.right = Node('F', nothing, nothing)
        root.left.right.left.left = Node('G', nothing, nothing)

        println("Pre-Order Traversal")
        pre_order(root)
        println("")
        println("In-Order Traversal")
        in_order(root)
        println("")
        println("Post-Order Traversal")
        post_order(root)
    end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .MyBinaryTree
    MyBinaryTree.main()
end

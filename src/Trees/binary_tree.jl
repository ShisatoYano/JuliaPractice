#=
binary_tree:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-21
=#

# define node class like Python
module node
    export Node

    # member variables
    mutable struct Node
        _label
        _right # child node, right
        _left # child node, left
    end

    # initialization
    function Node(label::String, right, left)
        _label = label
        _right = right
        _left = left
        return Node(_label, _right, _left)
    end
end

using .node

function preorder(node)
    if node == nothing
        return
    end
    println(node._label)
    preorder(node._left)
    preorder(node._right)
end

function main()
    # define binary tree
    root = Node('A', nothing, nothing)
    root._left = Node('B', nothing, nothing)
    root._right = Node('H', nothing, nothing)
    root._left._left = Node('C', nothing, nothing)
    root._left._right = Node('D', nothing, nothing)
    root._left._right._left = Node('E', nothing, nothing)
    root._left._right._right = Node('F', nothing, nothing)
    root._left._right._left._left = Node('G', nothing, nothing)

    println("Pre-Order Traversal")
    preorder(root)
    println("")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

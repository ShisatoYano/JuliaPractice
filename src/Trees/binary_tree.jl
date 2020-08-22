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

function pre_order(node)
    if node == nothing
        return
    end
    println(node._label)
    pre_order(node._left)
    pre_order(node._right)
end

function in_order(node)
    if node == nothing
        return
    end
    in_order(node._left)
    println(node._label)
    in_order(node._right)
end

function post_order(node)
    if node == nothing
        return
    end
    post_order(node._left)
    post_order(node._right)
    println(node._label)
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
    @time pre_order(root)
    println("")
    println("In-Order Traversal")
    @time in_order(root)
    println("")
    println("Post-Order Traversal")
    @time post_order(root)
    println("")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

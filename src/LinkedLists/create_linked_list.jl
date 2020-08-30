#=
create_linked_list:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-30
=#

module LinkedListCreation

    # node class
    mutable struct Node
        data
        p_next
    end

    # head node
    head = nothing

    # method to print contents of linked list
    function print_list()
        tmp = head
        while tmp != nothing
            println(tmp.data)
            tmp = tmp.p_next
        end
    end

    function main()
        # create simple linked list with 3 nodes
        # next pointer of each node is initialized as Null
        global head = Node(1, nothing)
        second = Node(2, nothing)
        third = Node(3, nothing)

        # link first node with second
        head.p_next = second

        # link second node with third
        second.p_next = third

        print_list()
    end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .LinkedListCreation
    LinkedListCreation.main()
end
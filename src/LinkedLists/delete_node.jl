#=
delete_node:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-31
=#

module NodeDelete

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

    function delete_node(data)
        tmp = head

        if tmp.data == data
            return head.p_next
        end

        while tmp.p_next != nothing
            if tmp.p_next.data == data
                tmp.p_next = tmp.p_next.p_next
                return head
            end
            tmp = tmp.p_next
        end

        return head
    end

    function main()
        # create simple linked list
        # next pointer of each node is initialized as Null
        global head = Node(1, nothing)
        second = Node(2, nothing)
        third = Node(3, nothing)
        fourth = Node(4, nothing)
        fifth = Node(5, nothing)

        head.p_next = second # link first node with second
        second.p_next = third # link second node with third
        third.p_next = fourth # link third node with fourth
        fourth.p_next = fifth # link forth node with fifth

        println("Original Linked List")
        print_list()
        println("")
        println("Delete 3 from Linked List")
        head = delete_node(3)
        print_list()
    end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .NodeDelete
    NodeDelete.main()
end
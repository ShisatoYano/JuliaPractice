#=
circular_linked_list:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-01
=#

module CircularLinkedList

    # node class
    mutable struct Node
        data
        next
    end

    # head and tail pointer as null
    head = Node(nothing, nothing)
    tail = Node(nothing, nothing)
    head.next = tail
    tail.next = head
    size = 0

    function add(data)
        new_node = Node(data, nothing)

        # check if list is empty
        if head.data == nothing
            global head = new_node
            global tail = new_node
            new_node.next = head
        else
            tail.next = new_node
            tail = new_node
            tail.next = head
        end
        global size += 1
    end

    function delete_middle()
        if head == nothing
            return
        else
            # mid position of list
            if size % 2 == 0
                count = size ÷ 2
            else
                count = (size + 1) ÷ 2
            end
            # check whether head is equal to tail or not
            # if yes then list has only one node
            if head != tail
                tmp = head
                current = nothing
                # current will point to node previous to tmp
                for i in 1:count-1
                    current = tmp
                    tmp = tmp.next
                end
                if current != nothing
                    # tmp is mid node that need to be removed
                    # skip removed node
                    current.next = tmp.next
                    # delete tmp
                    tmp = nothing
                end
            else
                head = tail = nothing
            end
        end
        size -= 1
    end

    function show_list()
        current = head
        if head == nothing
            println("List is empty")
            return
        else
            print("$(current.data) ")
            while current.next != head
                current = current.next
                print("$(current.data) ")
            end
            println("")
        end
    end

    function main()
        # build circular linked list
        add(1)
        add(2)
        add(3)
        add(4)

        println("Original Linked List")
        show_list()
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .CircularLinkedList
    CircularLinkedList.main()
end
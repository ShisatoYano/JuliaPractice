#=
my_queue:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-17
=#

module MyQueue
    # variables
    size = 100
    head = 1
    tail = 1
    list = [0 for i in 1:size]

    # methods
    function get_next_idx(n)
        return (n + 1) % size
    end

    function enqueue(n)
        global head, tail
        if head == get_next_idx(tail)
            println("Queue is full")
            return false
        end
        println("Enqueue: $(tail)")
        list[tail] = n
        tail = get_next_idx(tail)
    end

    function dequeue()
        global head, tail
        if head == tail
            println("Queue is empty")
            return false
        end
        println("Dequeue: $(head)")
        n = list[head]
        head = get_next_idx(head)
    end

    function main()
        println("List size = $(size)")
        for idx in 1:size
            enqueue(idx)
        end

        for idx in 1:size
            dequeue()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .MyQueue
    @time MyQueue.main()
end



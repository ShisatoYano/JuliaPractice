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
        if (n + 1) == size
            return size
        else
            return (n + 1) % size
        end
    end

    function enqueue(n)
        global head, tail
        if head == get_next_idx(tail)
            println("Queue is full")
            return false
        end
        list[tail] = n
        tail = get_next_idx(tail)
        println("Enqueue:$(tail) Dequeue:$(head)")
    end

    function dequeue()
        global head, tail
        if head == tail
            println("Queue is empty")
            return false
        end
        n = list[head]
        head = get_next_idx(head)
        println("Enqueue:$(tail) Dequeue:$(head)")
    end

    function main()
        println("Enqueue:$(tail) Dequeue:$(head)")
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



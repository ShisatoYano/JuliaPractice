#=
my_queue:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-18
=#

module MyQueue
    # variables
    queue_size = 10 # max size of array
    queue_head = 1 # index of next deque
    queue_num = 0
    queue_data = [0 for i in 1:queue_size] # data

    function enqueue(n)
        global queue_num
        if queue_num < queue_size
            en_idx = (queue_head + queue_num) % queue_size
            if en_idx == 0
                en_idx = queue_size
            end
            queue_data[en_idx] = n
            queue_num += 1
            println("Enqueue $(n) : $(queue_data)")
            return true
        else
            println("Enqueue $(n) : Queue is full")
            return false
        end
    end

    function dequeue()
        global queue_head, queue_num
        if queue_num > 0
            deq_data = queue_data[queue_head]
            queue_data[queue_head] = 0
            deq_idx = (queue_head + 1) % queue_size
            if deq_idx == 0
                deq_idx = queue_size
            end
            queue_head = deq_idx
            queue_num -= 1
            println("Dequeue $(deq_data) : $(queue_data)")
            return true
        else
            return false
        end
    end

    function main()
        # enqueue 1~7 to array
        for i in 1:7
            enqueue(i)
        end
        # dequeue 1~4 from array
        for i in 1:4
            dequeue()
        end
        # enqueue 8~15 to array
        for i in 8:15
            enqueue(i)
        end
        # dequeue until queue become empty
        while queue_num > 0
            dequeue()
        end
        println("Queue is empty")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .MyQueue
    @time MyQueue.main()
end



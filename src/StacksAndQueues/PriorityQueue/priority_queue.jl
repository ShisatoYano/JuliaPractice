#=
priority_queue:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-18
=#

module PQueue
    using StatsBase

    buffer = []

    # move added node to root
    function upheap(buffer, n)
        while true
            p = Int(trunc((n - 1)/2)) + 1
            println("$(buffer), $(buffer[p]), $(buffer[n])")
            if (p < -1) || (buffer[p] <= buffer[n])
                break
            end
            tmp = buffer[n]
            buffer[n] = buffer[p]
            buffer[p] = tmp
            n = p
        end
    end

    # add data to tail of buffer
    # after adding, sort as upheap
    function push(buffer, data)
        push!(buffer, data)
        upheap(buffer, length(buffer))
        println(buffer)
    end

    function main()
        input = sample(1:100, 10, replace=false)
        # create upheap
        for n in input
            push(buffer, n)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .PQueue
    PQueue.main()
end
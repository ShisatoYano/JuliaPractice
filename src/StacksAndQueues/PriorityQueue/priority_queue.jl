#=
priority_queue:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-10-18
=#

module PQ
    using StatsBase

    buffer = []

    # move added node to root
    function upheap(buffer, n)
        while true
            p = Int(trunc((n - 1)/2))
            if (p < -1) || (buffer[p+1] <= buffer[n+1])
                break
            end
            tmp = buffer[n+1]
            buffer[n+1] = buffer[p+1]
            buffer[p+1] = tmp
            n = p
        end
    end

    # move root node to leaf
    function downheap(buffer, n)
        len = length(buffer)
        while true
            c = 2 * n + 1
            if c >= len
                break
            end
            # exchange parent and smaller child
            if (c + 1) < len
                if buffer[c+1] > buffer[c+2]
                    c += 1
                end
            end
            if buffer[n+1] <= buffer[c+1]
                break
            end
            tmp = buffer[n+1]
            buffer[n+1] = buffer[c+1]
            buffer[c+1] = tmp
            n = c
        end
    end

    # add data to tail of buffer
    # after adding, sort as upheap
    function push(buffer, data)
        push!(buffer, data)
        upheap(buffer, length(buffer)-1)
    end

    # get minimum data
    function peek(buffer)
        return buffer[1]
    end
    
    # get and remove minimum data
    function pop(buffer)
        min_val = buffer[1]
        last_val = buffer[end]
        deleteat!(buffer, length(buffer))
        if length(buffer) > 0
            # create heap again
            buffer[1] = last_val
            downheap(buffer, 0)
        end
        return min_val
    end

    function main()
        input = sample(1:100, 10, replace=false)
        # create by upheap
        for n in input
            push(buffer, n)
            println("Add $(n), Min data = $(peek(buffer))")
        end
        # remove minimum data and create by downheap
        while length(buffer) > 0
            print("$(pop(buffer)) ")
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .PQ
    PQ.main()
end
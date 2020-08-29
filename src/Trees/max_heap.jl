#=
max_heap:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-25
=#

module MyMaxHeap

    # heap list
    heap_list = [0]
    current_size = 0
    input_list = [9, 21, 5, 14, 33, 19, 17, 11, 27, 18]

    function min_child_idx(idx)
        if (idx * 2 + 1) > current_size
            return idx * 2
        else
            if heap_list[idx * 2] < heap_list[idx * 2 + 1]
                return idx * 2 + 1
            else
                return idx * 2
            end
        end
    end

    # method to swap the root with its biggest
    # child bigger than the root. For percolating
    # a node down the tree.
    function perc_down(idx)
        while (idx * 2) <= current_size
            mc_idx = min_child_idx(idx)
            if heap_list[idx] < heap_list[mc_idx]
                tmp = heap_list[idx]
                heap_list[idx] = heap_list[mc_idx]
                heap_list[mc_idx] = tmp
            end
            idx = mc_idx
        end
    end

    # method to make as it moves the node
    # in an input list into their proper position
    function build_heap(list)
        println("Building a Heap from List $(list)")
        i = length(list) ÷ 2
        global current_size = length(list)
        global heap_list = list
        while i > 0
            perc_down(i)
            println("i = $(i): $(heap_list)")
            i -= 1
        end
    end

    # method to percolate a new item
    # as far up in the tree as it needs to
    # go to maintain the heap property
    function perc_up(idx)
        while (idx ÷ 2) > 0
            if heap_list[idx] > heap_list[idx ÷ 2]
                tmp = heap_list[idx ÷ 2]
                heap_list[idx ÷ 2] = heap_list[idx]
                heap_list[idx] = tmp
            end
            println("i = $(idx): $(heap_list)")
            idx = idx ÷ 2
        end
    end

    # method to append an item to the end of list
    # regain the heap structure property by
    # comparing the newly added item with its parent
    function insert(element)
        println("Insert $(element) to heap")
        push!(heap_list, element)
        println(heap_list)
        global current_size += 1
        perc_up(current_size)
    end

    # method to remove maximum item from root of heap
    # after removed, restore full compliance with
    # heap structure and heap order policy
    function remove_max()
        max_item = heap_list[1]
        println("Remove max item $(max_item) from heap")
        heap_list[1] = heap_list[current_size]
        global current_size -= 1
        pop!(heap_list)
        perc_down(1)
        println(heap_list)
    end

    function main()
        build_heap(input_list)
        println("")
        insert(50)
        println("")
        remove_max()
    end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .MyMaxHeap
    MyMaxHeap.main()
end
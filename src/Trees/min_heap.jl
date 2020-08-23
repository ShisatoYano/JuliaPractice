#=
min_heap:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-23
=#

# heap list
heap_list = [0]
current_size = 0

# method to percolate a new item
# as far up in the tree as it needs to
# go to maintain the heap property
function perc_up(idx)
    while (idx ÷ 2) > 0
        if heap_list[idx] < heap_list[idx ÷ 2]
            tmp = heap_list[idx ÷ 2]
            heap_list[idx ÷ 2] = heap_list[idx]
            heap_list[idx] = tmp
        end
        idx = idx ÷ 2
    end
end

# method to append an item to the end of list
# regain the heap structure property by
# comparing the newly added item with its parent
function insert(element)
    push!(heap_list, element)
    current_size += 1
    perc_up(current_size)
end

function main()
    # define tree
#     insert(5)
#     insert(3)
#     insert(17)
#     insert(10)
#     insert(84)
#     insert(19)
#     insert(6)
#     insert(22)
#     insert(9)
#
#     build_min_heap()
#
#     show_heap()
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
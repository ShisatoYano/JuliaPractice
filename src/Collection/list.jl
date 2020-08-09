#=
list:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module List
    # lists, 1-dim Array type
    list_empty = []
    list = [1, 2]

    # methods
    function main()
        println("Empty list = ", list_empty)
        println("Array{Int64} list = ", list)
        println("Push first 0: ", pushfirst!(list, 0))
        println("Push end 3: ", push!(list, 3))
        println("Delete end element: ", pop!(list))
        println("After pop!: ", list)
        println("Insert i = 1: ", insert!(list, 1, 1))
        println("Delete i = 2:", deleteat!(list, 2))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .List
    List.main()
end

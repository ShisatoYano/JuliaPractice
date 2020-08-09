#=
set:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module SetModule
    # set
    s = Set([1, 2])

    # methods
    function main()
        println("Set s = $(s)")
        println("Type of s = $(typeof(s))")
        println("Add 3 to s: $(push!(s, 3))")
        println("Union [3, 4] to s: $(union(s, [3, 4]))")
        println("Intersect [3, 4] and s: $(intersect(s, [3, 4]))")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .SetModule
    SetModule.main()
end

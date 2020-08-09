#=
union_types:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module UnionTypes
    # type
    IntOrString = Union{Int, String}

    # methods
    function get_union_type(x::IntOrString)
        return typeof(x)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .UnionTypes
    println("Type(x=10) = ", UnionTypes.get_union_type(10))
    println("Type(x='Hello') = ", UnionTypes.get_union_type("Hello"))
end



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

    function main()
        println("Type(x=10) = ", get_union_type(10))
        println("Type(x='Hello') = ", get_union_type("Hello"))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .UnionTypes
    UnionTypes.main()
end



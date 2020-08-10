#=
parametric_types:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module Parametric
    # struct
    mutable struct Point{Type}
        x::Type
        y::Type
    end

    # methods
    function get_x_type(p::Point{Int})
        return typeof(p.x)
    end

    function get_x_type(p::Point{Float64})
        return typeof(p.x)
    end

    function main()
        p_int = Point(2, 3)
        p_float = Point(2.5, 3.8)
        println("Type of p_int.x = ", get_x_type(p_int))
        println("Type of p_float.x = ", get_x_type(p_float))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Parametric
    Parametric.main()
end
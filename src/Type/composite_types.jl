#=
composite_types:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module ComposTypes
    # struct
    struct Point
        x::Int
        y::Int
    end

    mutable struct PointMut
        x::Int
        y::Int
    end

    # methods
    function get_distance(p::Point)
        return sqrt(p.x^2 + p.y^2)
    end

    function main()
        p = Point(3, 5)
        println("defined struct Point p = ", p)
        println("p.x = $(p.x), p.y = $(p.y)")
        println("Distance = $(get_distance(p))")
        p_mut = PointMut(3, 5)
        println("defined mutable struct Point p_mut = ", p_mut)
        println("p_mut.x = $(p_mut.x), p_mut.y = $(p_mut.y)")
        println("set values to p_mut: x = 10, y = 20")
        p_mut.x = 10
        p_mut.y = 20
        println("p_mut.x = $(p_mut.x), p_mut.y = $(p_mut.y)")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .ComposTypes
    ComposTypes.main()
end

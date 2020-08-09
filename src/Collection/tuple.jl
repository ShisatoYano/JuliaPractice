#=
tuple:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module Tuple
    # tuple
    t = (1, 2, 3)

    # named tuple
    t_n = (a = 1, b = 2, c = 3)

    # array
    array = rand(4, 3)

    # methods
    function get_type(tuple)
        return typeof(tuple)
    end

    function get_val(tuple, idx)
        return tuple[idx]
    end

    function get_tuple(x...)
        return x
    end

    function main()
        println("Type of tuple, t = ", get_type(t))
        println("Type of tuple, t_n = ", get_type(t_n))
        println("Value of t[1] = ", get_val(t, 1))
        println("Value of t_n[1] = ", t_n[1])
        println("Value of t_n.a = ", t_n.a)
        println("Value of t_n[:a] = ", t_n[:a])
        println("Keys of t_n = ", keys(t_n))
        println("Values of t_n = ", values(t_n))
        println("rand(4, 3) = ", array)
        println("Size of rand(4, 3) = ", size(array))
        println(get_tuple(1, 2, 3))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Tuple
    Tuple.main()
end
#=
string:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-07
=#

module String
    # valuables
    str1 = "Hello Julia"

    # methods
    function get_str1()
        return str1
    end

    function get_str1_char(idx)
        return str1[idx]
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .String
    println("str1 = ", String.get_str1())
    println("str1[1] = ", String.get_str1_char(1))
    println("typeof(str1[1]) = ", typeof(String.get_str1_char(1)))
    println("str1[end] = ", String.get_str1()[end])
    println("str1[1:5] = ", String.get_str1_char(1:5))
end
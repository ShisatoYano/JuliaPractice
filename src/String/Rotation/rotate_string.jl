#=
rotate_string:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-30
=#

module Rotation
    function rotate_left(str, num)
        str_rot = join([str[num+1:end], str[1:num]], "")
        return str_rot
    end

    function rotate_right(str, num)
        return rotate_left(str, length(str) - num)
    end

    function main()
        println(rotate_left("GeeksForGeeks", 2))
        println(rotate_right("GeeksForGeeks", 2))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Rotation
    Rotation.main()
end
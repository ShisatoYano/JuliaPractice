#=
add:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

module Add
    function add(a, b)
        return a + b
    end

    function main()
        a = 5
        b = 9
        println("$a + $b = $(add(a, b))")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Add
    Add.main()
end

#=
add:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-03
=#

function add(a, b)
    return a + b
end

if abspath(PROGRAM_FILE) == @__FILE__
    a = 5
    b = 9
    println("$a + $b = $(add(a, b))")
end

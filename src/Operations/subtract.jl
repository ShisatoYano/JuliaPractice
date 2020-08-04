#=
subtract:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-04
=#

function subtract(a, b)
    return a - b
end

if abspath(PROGRAM_FILE) == @__FILE__
    a = 19
    b = 3
    println("$a - $b = $(subtract(a, b))")
end
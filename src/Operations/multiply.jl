#=
multiply:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-04
=#

function multiply(a, b)
    return a * b
end

if abspath(PROGRAM_FILE) == @__FILE__
    a = 15
    b = 12
    println("$a × $b = $(multiply(a, b))")
end

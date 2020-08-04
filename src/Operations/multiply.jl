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
    println("a = $a, b = $b")
    println()
    println("use *")
    println("a * b = $(multiply(a, b))")
    println()
    println("omit *")
    println("2a + b = $(2a + b)")
    println("(a + 2)b = ", (a + 2)b)
end

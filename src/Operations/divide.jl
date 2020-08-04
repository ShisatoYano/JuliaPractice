#=
divide:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-04
=#

function divide(a, b)
    return a / b
end

if abspath(PROGRAM_FILE) == @__FILE__
    a = 4
    b = 3
    println("a = $a, b = $b")
    println("a / b = $(divide(a, b))")
    println()
    println("divide round to 0")
    println("div(a, b) = ", div(a, b))
    println()
    println("remainder")
    println("a % b = ", a % b)
    println("rem(a, b) = ", rem(a, b))
end

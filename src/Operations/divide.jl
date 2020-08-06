#=
divide:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

module Division
    function divide(a, b)
        return a / b
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Division
    a = 4
    b = 3
    println("a = $a, b = $b")
    println("a / b = $(Division.divide(a, b))")
    println()
    println("divide round to 0")
    println("div(a, b) = ", div(a, b))
    println()
    println("remainder")
    println("a % b = ", a % b)
    println("rem(a, b) = ", rem(a, b))
end

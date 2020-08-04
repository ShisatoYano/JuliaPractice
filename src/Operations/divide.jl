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
    a = 18
    b = 2
    println("$a ÷ $b = $(divide(a, b))")
end

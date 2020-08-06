#=
subtract:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

module Subtraction
    function subtract(a, b)
        return a - b
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Subtraction
    a = 19
    b = 3
    println("$a - $b = $(Subtraction.subtract(a, b))")
end
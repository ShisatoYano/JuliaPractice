#=
if:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module If
    # methods
    function get_greater_value(val1, val2)
        if val1 > val2
            return val1
        elseif val1 < val2
            return val2
        else
            return nothing
        end
    end

    function check_greater_0(val)
        return val > 0 ? true : false
    end

    function check_negative_value(val)
        return val >= 0 && error("val must be negative")
    end

    function check_non_negative_value(val)
        return val >= 0 || error("val must be non-negative")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .If
    println("Get greater value")
    println("val1:5, val2:1 = ", If.get_greater_value(5, 1))
    println("val1:4, val2:5 = ", If.get_greater_value(4, 5))
    println("val1:1, val2:1 = ", If.get_greater_value(1, 1))
    println("")
    println("100 is greater than 0? ", If.check_greater_0(100))
    println("-1 is greater than 0? ", If.check_greater_0(-1))
    println("")
    println("check 10 is negative ", If.check_negative_value(10))
end

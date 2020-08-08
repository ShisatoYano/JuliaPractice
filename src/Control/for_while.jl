#=
if_while:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module ForWhile
    # methods
    function while_under_val(val)
        i = 1
        while i < val
            i += 1
        end
    end

    function for_val_times(val)
        j = 0
        for i = 1:val
            j += 1
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .ForWhile
    println("While 100000000 times")
    @time ForWhile.while_under_val(100000001)
    println("")
    println("For 100000000 times")
    @time ForWhile.for_val_times(100000000)
end

#=
try_catch_finally:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module TryCatchFinally
    # valuables
    str = "Hello Julia"

    # methods
    function get_char(idx)
        return str[idx]
    end

    # 1. find exception at try phase
    # 2. catch phase
    # 3. finally phase
    function catch_error()
        try
            println("get char[0]")
            char = get_char(0)
        catch
            println("Idx is out of bounds")
        finally
            println("get char[5]")
            char = get_char(5)
            println("char is $(char)")
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TryCatchFinally
    TryCatchFinally.catch_error()
end
#=
is_unique_bit_vector:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-23
=#

module UniqueCharBitChecker
    # methods
    function check_unique(str)
        println("")
        println("Check string $(str) is unique or not")

        checker = 0

        for i in 1:length(str)
            val = str[i] - 'a'
            if (checker & (1 << val)) > 0
                println("Not unique string")
                return false
            end
            checker |= (1 << val)
        end

        println("Unique string")
        return true
    end

    function main()
        @time println(check_unique("abcdefg"))
        @time println(check_unique("aaaaaaaaaaaa"))
        @time println(check_unique("axgilnrewqczpoh"))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .UniqueCharBitChecker
    UniqueCharChecker.main()
end
#=
is_unique_chars:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-21
=#

module UniqueCharChecker
    # parameters
    const max_len = 128

    # methods
    function check_unique(str)
        println("")
        println("Check string $(str) is unique or not")

        if length(str) > max_len
            println("Too long string")
            return
        end

        char_set = [false for i in 1:max_len]

        for j in 1:length(str)
            ascii = Int(str[j]) # used as idx of char_set
            if char_set[ascii]
                println("Not unique string")
                return
            end
            char_set[ascii] = true
        end
        println("Unique string")
    end

    function main()
        @time check_unique("abcdefg")
        @time check_unique("aaaaaaaaaaaa")
        @time check_unique("aAbBcCdD")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .UniqueCharChecker
    UniqueCharChecker.main()
end
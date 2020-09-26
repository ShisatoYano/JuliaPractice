#=
check_permutation_sort:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-26
=#

module SortPermuChecker
    # methods
    function check_permu_sort(str1, str2)
        println("")
        println("Check $(str1) and $(str2) are Permutaton or not")
        len_1 = length(str1)
        len_2 = length(str2)

        # string length is not same
        # can not be permutation
        if len_1 != len_2
            println("Not Permutation")
            return false
        end

        # sort both strings
        str1_sub = join(sort!(split(str1, "")))
        str2_sub = join(sort!(split(str2, "")))

        # compare sorted strings
        for i in 1:len_1
            if str1_sub[i] != str2_sub[i]
                println("Not Permutation")
                return false
            end
        end

        println("Permutation")
        return true
    end

    function main()
        @time println(check_permu_sort("test", "sett"))
        @time println(check_permu_sort("test", "ttew"))
        @time println(check_permu_sort("test", "testtest"))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .SortPermuChecker
    SortPermuChecker.main()
end
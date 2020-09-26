#=
check_permutation_count:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-26
=#

module CountPermuChecker
    # parameters
    const max_size = 256

    # methods
    function check_permu_count(str1, str2)
        println("")
        println("Check $(str1) and $(str2) are Permutaton or not")

        # initialize count array
        count1 = [0 for i in 1:max_size]
        count2 = [0 for i in 1:max_size]

        # increment count of each character
        for s in str1
            count1[Int(s)] += 1
        end
        for s in str2
            count2[Int(s)] += 1
        end

        # string length is not same
        # can not be permutation
        if length(str1) != length(str2)
            println("Not Permutation")
            return false
        end

        # compare count array
        for i in 1:max_size
            if count1[i] != count2[i]
                println("Not Permutation")
                return false
            end
        end

        println("Permutation")
        return true
    end

    function main()
        @time println(check_permu_count("test", "sett"))
        @time println(check_permu_count("geeksforgeeks", "forgeeksgeeks"))
        @time println(check_permu_count("abcdefg", "aabbccd"))
        @time println(check_permu_count("hogehoge", "hogeehoge"))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .CountPermuChecker
    CountPermuChecker.main()
end
#=
test_string:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module TestString
    # packages
    using Test

    # external modules
    include("string.jl")
    include("IsUnique/is_unique_chars.jl")
    include("IsUnique/is_unique_bit_vector.jl")
    include("Permutation/check_permutation_sort.jl")
    include("Permutation/check_permutation_count.jl")

    # method
    function test()
        @testset "String" begin
            @test_throws StringIndexError String.get_str2_unicode(2)
            @test_nowarn String.main()
        end
        @testset "IsUnique" begin
            @test UniqueCharChecker.check_unique("abcdefg") == true
            @test UniqueCharChecker.check_unique("aaaaaaaaaaaa") == false
            @test UniqueCharChecker.check_unique("aAbBcCdD") == true
            @test UniqueCharBitChecker.check_unique("axgilnrewqczpoh") == true
            @test UniqueCharBitChecker.check_unique("bbbbbbbb") == false
        end
        @testset "Permutation" begin
            @test SortPermuChecker.check_permu_sort("test", "sett") == true
            @test SortPermuChecker.check_permu_sort("test", "ttew") == false
            @test SortPermuChecker.check_permu_sort("hoge", "hogee") == false
            @test CountPermuChecker.check_permu_count("test", "sett") == true
            @test CountPermuChecker.check_permu_count("abcdefg", "aabbccd") == false
            @test CountPermuChecker.check_permu_count("geeksfor", "forgeeks") == true
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestString
    TestString.test()
end
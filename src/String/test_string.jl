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

    # method
    function test()
        @testset "String" begin
            @test String.get_str1() == "Hello Julia"
            @test String.get_str1_char(1) == 'H'
            @test_throws BoundsError String.get_str1_char(0)
            @test String.get_str2() == "こんにちは、Julia"
            @test String.get_str2_unicode(1) == 'こ'
            @test_throws StringIndexError String.get_str2_unicode(2)
            @test_nowarn String.connect_str("Julia", "Lang")
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestString
    TestString.test()
end
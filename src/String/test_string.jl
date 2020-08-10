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
            @test_throws StringIndexError String.get_str2_unicode(2)
            @test_nowarn String.main()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestString
    TestString.test()
end
#=
test_complex_number:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-07
=#

module TestCompNum
    # packages
    using Test

    # external modules
    include("complex_number.jl")

    # method
    function test()
        @testset "CompNum" begin
            @test_nowarn CompNum.main()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestCompNum
    TestCompNum.test()
end
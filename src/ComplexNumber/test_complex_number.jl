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
        expr1 = CompNum.get_expr1()
        expr2 = CompNum.get_expr2()
        @testset "CompNum" begin
            @test expr1 == 1 + 2im
            @test expr2 == 2 - 3im
            @test CompNum.multiply(expr1, expr2) == 8 + 1im
            @test CompNum.get_real(expr1) == 1
            @test CompNum.get_imag(expr1) == 2
            @test CompNum.get_conj(expr1) == 1 - 2im
            @test CompNum.get_abs(expr1) == 2.23606797749979
            @test CompNum.get_real(expr2) == 2
            @test CompNum.get_imag(expr2) == -3
            @test CompNum.get_conj(expr2) == 2 + 3im
            @test CompNum.get_abs(expr2) == 3.605551275463989
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestCompNum
    TestCompNum.test()
end
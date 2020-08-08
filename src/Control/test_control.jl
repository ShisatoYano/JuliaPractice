#=
test_control:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module TestControl
    # packages
    using Test

    # external modules
    include("if.jl")
    include("for_while.jl")
    include("try_catch_finally.jl")

    # methods
    function test()
        @testset "Control" begin
            @testset "If" begin
                @test If.get_greater_value(12, 8) == 12
                @test If.get_greater_value(-2, 50) == 50
                @test If.get_greater_value(3, 3) == nothing
                @test If.check_greater_0(37) == true
                @test If.check_greater_0(-100) == false
                @test_throws ErrorException If.check_negative_value(40)
                @test_throws ErrorException If.check_non_negative_value(-40)
            end
            @testset "ForWhile" begin
                @test_nowarn ForWhile.while_under_val(1000000001)
                @test_nowarn ForWhile.for_val_times(1000000000)
            end
            @testset "TryCatchFinally" begin
                @test TryCatchFinally.catch_error() == 'o'
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using.TestControl
    TestControl.test()
end
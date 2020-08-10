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
                @test_nowarn If.main()
                @test_throws ErrorException If.check_negative_value(40)
                @test_throws ErrorException If.check_non_negative_value(-40)
            end
            @testset "ForWhile" begin
                @test_nowarn ForWhile.main()
            end
            @testset "TryCatchFinally" begin
                @test_nowarn TryCatchFinally.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using.TestControl
    TestControl.test()
end
#=
run_tests:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-05
=#

module TestsRunner
    # packages
    using Test

    # external modules
    include("../HelloWorld/test_hello_world.jl")

    # methods
    function run_tests()
        @testset "JuliaPractice" begin
            TestHelloWorld.test()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestsRunner
    TestsRunner.run_tests()
end
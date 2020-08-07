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
    include("../Module/test_module.jl")
    include("../Operations/test_operations.jl")
    include("../ComplexNumber/test_complex_number.jl")

    # methods
    function run_tests()
        @testset "JuliaPractice" begin
            TestHelloWorld.test()
            TestModule.test()
            TestOperations.test()
            TestCompNum.test()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestsRunner
    @time TestsRunner.run_tests()
end
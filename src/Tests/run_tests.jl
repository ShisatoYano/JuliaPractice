#=
run_tests:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module TestsRunner
    # packages
    using Test

    # external modules
    include("../HelloWorld/test_hello_world.jl")
    include("../Module/test_module.jl")
    include("../Operations/test_operations.jl")
    include("../ComplexNumber/test_complex_number.jl")
    include("../String/test_string.jl")
    include("../Control/test_control.jl")
    include("../Type/test_types.jl")
    include("../Collection/test_collection.jl")
    include("../Array/test_array.jl")
    include("../Plots/test_plots.jl")
    include("../DataFrames/test_df.jl")
    include("../StacksAndQueues/test_stack_queue.jl")
    include("../Trees/test_trees.jl")
    include("../LinkedLists/test_linked_lists.jl")
    include("../Search/test_search.jl")

    # methods
    function tests()
        @testset "JuliaPractice" begin
            TestHelloWorld.test()
            TestModule.test()
            TestOperations.test()
            TestCompNum.test()
            TestString.test()
            TestControl.test()
            TestTypes.test()
            TestCollection.test()
            TestArray.test()
            TestPlots.test()
            TestDf.test()
            TestStackQueue.test()
            TestTrees.test()
            TestLinkedLists.test()
            TestSearch.test()
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestsRunner
    @time TestsRunner.tests()
end
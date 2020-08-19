#=
test_stack_queue:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-19
=#

module TestStackQueue
    # packages
    using Test

    # external modules
    include("my_queue.jl")
    include("my_stack.jl")

    # methods
    function test()
        @testset "StackQueue" begin
            @testset "Stack" begin
                @test_nowarn MyStack.main()
            end
            @testset "Queue" begin
                @test_nowarn MyQueue.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestStackQueue
    TestStackQueue.test()
end
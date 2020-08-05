#=
test_hello_world:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-05
=#

module TestHelloWorld
    # packages
    using Test

    # external modules
    include("hello_world.jl")

    # methods
    function test()
        @testset "HelloWorld" begin
            @test HelloWorld.show_hello_world() == true
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestHelloWorld
    TestHelloWorld.test()
end
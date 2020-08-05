#=
test_module:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

module TestModule
    # packages
    using Test

    # extarnel modules
    include("simple_module.jl")

    # methods
    function test()
        @testset "Module" begin
            @testset "SimpleModule" begin
                @test SimpleModule.hoge == 2
                @test SimpleModule.hello("Julia") == true
                @test SimpleModule.goodbye("Julia") == true
            end
        end
    end
end

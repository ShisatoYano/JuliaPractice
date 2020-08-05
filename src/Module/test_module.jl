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
    include("nest_module.jl")

    # methods
    function test()
        @testset "Module" begin
            @testset "SimpleModule" begin
                @test SimpleModule.hoge == 2
                @test SimpleModule.hello("Julia") == true
                @test SimpleModule.goodbye("Julia") == true
            end

            @testset "NestModule" begin
                @test NestModule.name == "Julia"
                @test NestModule.Hello.hello(NestModule.name) == true
                @test NestModule.Bye.byebye(NestModule.name) == true
            end
        end
    end
end

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
                @test_nowarn SimpleModule.hello("Julia")
                @test_nowarn SimpleModule.goodbye("Julia")
            end

            @testset "NestModule" begin
                @test NestModule.name == "Julia"
                @test_nowarn NestModule.Hello.hello(NestModule.name)
                @test_nowarn NestModule.Bye.byebye(NestModule.name)
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using. TestModule
    TestModule.test()
end

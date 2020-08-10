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
                @test_nowarn SimpleModule.main()
            end

            @testset "NestModule" begin
                @test_nowarn NestModule.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using. TestModule
    TestModule.test()
end

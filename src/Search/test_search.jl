#=
test_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-21
=#

module TestSearch
    # packages
    using Test

    # external modules
    include("RabinKarpStringSearch/rabin_karp_string_search.jl")

    # methods
    function test()
        @testset "Search" begin
            @testset "RabinKarpSearch" begin
                @test_nowarn RabinKarpSearch.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestSearch
    TestSearch.test()
end
#=
test_linked_lists:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-03
=#

module TestLinkedLists
    # packages
    using Test

    # external modules
    include("create_linked_list.jl")
    include("circular_linked_list.jl")
    include("delete_node.jl")

    # methods
    function test()
        @testset "LinkedLists" begin
            @testset "LinkedListCreation" begin
                @test_nowarn LinkedListCreation.main()
            end
            @testset "NodeDelete" begin
                @test_nowarn NodeDelete.main()
            end
            @testset "CircularLinkedList" begin
                @test_nowarn CircularLinkedList.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestLinkedLists
    TestLinkedLists.test()
end
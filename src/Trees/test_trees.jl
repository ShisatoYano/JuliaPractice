#=
test_trees:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-29
=#

module TestTrees
    # packages
    using Test

    # external modules
    include("binary_tree.jl")
    include("max_heap.jl")
    include("min_heap.jl")
    include("trie.jl")

    # methods
    function test()
        @testset "Trees" begin
            @testset "BinaryTree" begin
                @test_nowarn MyBinaryTree.main()
            end
            @testset "MyMaxHeap" begin
                @test_nowarn MyMaxHeap.main()
            end
            @testset "MyMinHeap" begin
                @test_nowarn MyMinHeap.main()
            end
            @testset "MyTrie" begin
                @test_nowarn MyTrie.main()
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .TestTrees
    TestTrees.test()
end
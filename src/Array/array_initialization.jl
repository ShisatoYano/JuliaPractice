#=
array_initialization:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-10
=#

module ArrayInit
    # methods
    function main()
        println("Not init array = ", Array{Float32}(undef, 3, 2))
        println("Init 0 array = ", zeros(Float32, 3, 2))
        println("Init 1 array = ", ones(Float32, 3, 2))
        println("Init uniform distribution = ", rand(Float32, 3, 2))
        println("Init normal distribution = ", randn(Float32, 3, 2))
        println("Init fill 8 = ", fill(8, 3, 2))
        println("Init zeros fill 10 = ", fill!(zeros(Int32, 4, 4), 10))
        println("Similar not init = ", similar(fill(8, 4, 4)))
        println("Similar init float32 = ", similar(fill(8, 4, 4), Float32))
        println("Similar init float32 3x2 = ", similar(fill(8, 4, 4), Float32, 3, 2))
        println("Reshape 3x2 -> 2x3: ", reshape(zeros(Float32, 3, 2), 2, 3))
        println("List Comprehension [x for x in 1:10] = ", [x for x in 1:10])
        println("List Comprehension [10a + b for a in 0:3, b in 0:4] = ", [10a + b for a in 0:3, b in 0:4])
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .ArrayInit
    ArrayInit.main()
end
#=
array_operation:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-10
=#

module ArrayOp
    # packages
    using LinearAlgebra

    # array
    A = randn(Float32, 3, 2)
    B = collect(reshape(1:9, 3, 3))
    C = fill(4, 3, 3)
    D = fill(2, 3, 3)

    # methods
    function info()
        println("Array A = $A")
        println("Element type of A = ", eltype(A))
        println("Element num of A = ", length(A))
        println("Dimension num of A = ", ndims(A))
        println("Size of A = ", size(A))
        println("Size of A, dim:1 = ", size(A, 1))
        println("Size of A, dim:2 = ", size(A, 2))
        println("Strides of A = ", strides(A))
        println("Stride of A, 2 = ", stride(A, 2))
        println("")
    end

    function indexing()
        println("Array C = $B")
        println("B[3, 3] = ", B[3, 3])
        println("B[2, :] = ", B[2,:])
        println("B[:, 1] = ", B[:,1])
        B[1, 2] = -10
        println("B[1, 2] = -10: ", B)
        B[2:3, 2:3] = [-5 -5; -3 -3]
        println("B[2:3, 2:3] = -10: ", B)
        println("")
    end

    function four_arithmetic()
        println("Array C = $C")
        println("Array D = $D")
        println("C + D = ", C + D)
        println("C - D = ", C - D)
        println("C * D = ", C * D)
        println("")
    end

    function sigmoid(x::Float64)
        return 1.0 / (1.0 + exp(-x))
    end

    function broad_cast()
        println("C .+ D = ", C .+ D)
        println("C .+ 10 = ", C .+ 10)
        println("C .- D = ", C .- D)
        println("C .- 10 = ", C .- 10)
        println("C .* D = ", C .* D)
        println("C .* 10 = ", C .* 10)
        println("C ./ D = ", C ./ D)
        println("C ./ 10 = ", C ./ 10)
        println("Element type of (C./D) = ", eltype(C ./ D))
        println("sigmoid.() = ", sigmoid.(rand(3, 2)))
        println("")
    end

    function map_red_fil()
        E = rand(4, 3)
        println("Array E = ", E)
        println("map(x -> x + 1.0, E) = ", map(x -> x + 1.0, E))
        println("All of mult, reduce(*, E) = ", reduce(*, E))
        println("filter(x -> x < 0.5, E) = ", filter(x -> x < 0.5, E))
        println("")
    end

    function matrix()
        F = rand(5, 5)
        println("Array F = ", F)
        println("Inversed Matrix inv(F) = ", inv(F))
        println("Transposed Matrix F' = ", F')
        println("Eigen Values eigvals(F) = ", eigvals(F))
        println("Eigen Vectors eigvecs(F) = ", eigvecs(F))
        println("")
    end

    function copy_shallow()
        println("Shallow copy")
        G = rand(5, 5)
        println("Array G = ", G)
        H = G
        println("H = G: ", H)
        H .= 0.0
        println("H .= 0.0: ", H)
        println("Array G = ", G)
    end

    function copy_deep()
        println("Deep copy")
        G = rand(5, 5)
        println("Array G = ", G)
        H = copy(G)
        println("H = copy(G): ", H)
        H .= 0.0
        println("H .= 0.0: ", H)
        println("Array G = ", G)
    end

    function main()
        info()
        indexing()
        four_arithmetic()
        broad_cast()
        map_red_fil()
        matrix()
        copy_shallow()
        copy_deep()
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .ArrayOp
    ArrayOp.main()
end

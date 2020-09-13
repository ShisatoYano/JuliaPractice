#=
create_df:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-13
=#

module DfCreator
    # packages
    using DataFrames

    # data
    data_mat = [
    1 0.179324  "A"
    2 0.818923  "B"
    3 0.979487  "C"
    4 0.882494  "A"
    5 0.0530208 "B"
    ]

    # methods
    function mat_2_df()
        df_mat = DataFrame(data_mat)
        println("DataFrame from Matrix = ", df_mat)
        println("")
    end

    function add_row_name()
        df_rn = DataFrame(data_mat, [:A, :B, :C])
        println("DataFrame + Row name = ", df_rn)
        println("")
    end

    function rv_2_df()
        df_rv = DataFrame(
            A = 1:5,
            B = rand(5),
            C = ["A", "B", "C", "A", "B"])
        println("DataFrame from row vector = ", df_rv)
        println("")
    end

    function dict_2_df()
        dict = Dict(
            :A => 1:5,
            :B => rand(5),
            :C => ["A", "B", "C", "A", "B"])
        df_dict = DataFrame(dict)
        println("DataFrame from dictionary = ", df_dict)
        println("")
    end

    function main()
        mat_2_df()
        add_row_name()
        rv_2_df()
        dict_2_df()
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .DfCreator
    DfCreator.main()
end

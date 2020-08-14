#=
operate_df:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-14
=#

module DfOperator
    # packages
    using DataFrames
    using Statistics

    # dataframe
    global df = DataFrame(
            A = 1:5,
            B = rand(5),
            C = ["A", "B", "C", "A", "B"])

    # method
    function get_first_last(n)
        println("Dataframe first $(n) columns = ", first(df, n))
        println("")
        println("Dataframe last $(n) columns = ", last(df, n))
        println("")
    end

    function get_info()
        println("Data size = ", size(df))
        println("Column Names = ", names(df))
        println("Data type = ", eltype.(eachcol(df)))
        println("Describe = ", describe(df))
        println("")
    end

    function extract()
        println("df.A = ", df.A)
        println("")
        println("df[:, [:A, :B]] = ", df[:, [:A, :B]])
        println("")
        df.D = df.A .* 40
        println("df.D = df.A .* 40: ", df)
        println("")
        println("df[2, :] ", df[2, :])
        println("")
        println("df[2:5, :] ", df[2:5, :])
        println("")
        println("df[df.A.>3, :] ", df[df.A.>3, :])
        println("")
        println("df[(df.A.>3).&(df.C.=='B'), :] ", df[(df.A.>3).&(df.C.=="B"), :])
        println("")
        df[(df.A.>3).&(df.C.=="B"), :C] .= "X"
        println("df[(df.A.>3).&(df.C.=='B'), :C] .= 'X' ", df)
        println("")
    end

    function union_join()
        df_2 = DataFrame(
            A = [10],
            B = [0.1],
            C = ["C"],
            D = [20])
        println("append!(df, df_2) = ", append!(df, df_2))
        println("")
        df_3 = DataFrame(C = ["A", "B"], E = ["abs", "xyz"])
        println("Inner join(df, df_3, on=:C) = ", join(df, df_3, on=:C))
        println("")
        println("Left join(df, df_3, on=:C, kind=:left) = ", join(df, df_3, on=:C, kind=:left))
        println("")
    end

    function aggregate_by()
        println("aggregate(df, :C, sum) = ", aggregate(df, :C, sum))
        println("")
        println("by(df, :C, x->mean(x[:A])) = ", by(df, :C, x->mean(x[:A])))
        println("")
        println("mean(df[:B]) = ", mean(df[:B]))
        println("")
    end

    function sort_up_down()
        println("sort!(df, :B) = ", sort!(df, :B))
        println("")
        println("sort!(df, :B, rev=true) = ", sort!(df, :B, rev=true))
        println("")
    end

    function change_colname()
        new_col_list = [:W, :X, :Y, :Z]
        println("Change Col Name by List = ", rename!(df, new_col_list))
        println("")
        new_col_dict = Dict(:W=>:A, :X=>:B, :Y=>:C, :Z=>:D)
        println("Change Col Name by Dict = ", rename!(df, new_col_dict))
        println("")
    end

    function v_h_cat()
        df_4 = DataFrame(A = [1, 2, 3], B = [4, 5, 6])
        df_5 = DataFrame(A = [11, 12, 13], B = [14, 15, 16])
        println("vcat(df_4, df_5) = ", vcat(df_4, df_5))
        println("")
        df_6 = DataFrame(A = [1, 2, 3], B = [4, 5, 6])
        df_7 = DataFrame(C = [11, 12, 13], D = [14, 15, 16])
        println("hcat(df_6, df_7) = ", hcat(df_6, df_7))
        println("")
    end

    function main()
        get_first_last(3)
        get_info()
        extract()
        union_join()
        aggregate_by()
        sort_up_down()
        change_colname()
        v_h_cat()
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .DfOperator
    DfOperator.main()
end
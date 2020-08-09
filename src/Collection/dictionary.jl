#=
dictionary:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-09
=#

module Dictionary
    # dict
    d = Dict{String, Int}()

    # methods
    function add_key_val(key::String, val::Int)
        d[key] = val
        return d
    end

    function get_by_key(key::String)
        return d[key]
    end

    function iterate_for(d::Dict)
        for (key, val) in d
            println(key, val)
        end
    end

    function main()
        println("Add 'a', 1: ", add_key_val("a", 1))
        println("Add 'b', 2: ", add_key_val("b", 2))
        println("Add 'c', 3: ", add_key_val("c", 3))
        println("Get val of 'a': ", get_by_key("a"))
        println("Has key, 'b': ", haskey(d, "b"))
        iterate_for(d)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Dictionary
    Dictionary.main()
end
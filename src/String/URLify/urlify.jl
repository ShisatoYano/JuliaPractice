#=
urlify:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-27
=#

module URLify
    # parameters
    const max_len = 1000

    # methods
    function replace_space(str)
        # remove leading and trailing spaces
        str = strip(str, [' '])

        # check current lenght and count spaces
        len_str = length(str)
        spc_count = count(i->(i==' '), str)

        # calculate new length
        new_len = len_str + spc_count * 2
        if new_len > max_len
            println("New lenght is longer than maximum")
            return -1
        end

        # start index filling char from end
        index = new_len

        str_sub = split(str, "")

        # fill string array
        for i in (len_str-2):(new_len-3)
            push!(str_sub, "0")
        end

        # fill rest of string from end
        for i in (len_str):-1:1
            println(str_sub[i])
        end
    end

    function main()
        println(replace_space(" Mr John Smith "))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .URLify
    URLify.main()
end
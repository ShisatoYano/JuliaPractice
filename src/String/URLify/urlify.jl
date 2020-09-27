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

    end

    function main()
        println(replace_space("Mr John Smith "))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .URLify
    URLify.main()
end
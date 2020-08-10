#=
hello_world:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-05
=#

module HelloWorld
    # methods
    function main()
        println("Hello world!!")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .HelloWorld
    HelloWorld.main()
end

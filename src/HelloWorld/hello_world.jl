#=
hello_world:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-05
=#

module HelloWorld
    is_ok = false
    function show_hello_world()
        println("Hello world!!")
        is_ok = true
        return is_ok
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .HelloWorld
    HelloWorld.show_hello_world()
end

#=
nest_module:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-05
=#

# main module
module Greeting
    name = "Julia"

    # sub module1
    module Hello
        import ..Greeting

        function hello(name)
            println("Hello $(name)!!")
        end
    end

    # sub module2
    module Bye
        import ..Greeting

        function byebye(name)
            println("Byebye $(name)!!")
        end
    end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Greeting
    println("Greeting.name = ", Greeting.name)
    Greeting.Hello.hello(Greeting.name)
    Greeting.Bye.byebye(Greeting.name)
end
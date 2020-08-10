#=
nest_module:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

# main module
module NestModule
    name = "Julia"

    # sub module1
    module Hello
        import ..NestModule

        function hello(name)
            println("Hello $(name)!!")
        end
    end

    # sub module2
    module Bye
        import ..NestModule

        function byebye(name)
            println("Byebye $(name)!!")
        end
    end

    function main()
        println("NestModule.name = ", name)
        Hello.hello(name)
        Bye.byebye(name)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .NestModule
    NestModule.main()
end
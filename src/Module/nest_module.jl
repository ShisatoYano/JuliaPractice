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
            return true
        end
    end

    # sub module2
    module Bye
        import ..NestModule

        function byebye(name)
            println("Byebye $(name)!!")
            return true
        end
    end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .NestModule
    println("NestModule.name = ", NestModule.name)
    NestModule.Hello.hello(NestModule.name)
    NestModule.Bye.byebye(NestModule.name)
end
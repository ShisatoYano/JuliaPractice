#=
simple_module:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-06
=#

module SimpleModule
    # values
    hoge = 2

    # methods
    function hello(name)
        println("Hello $(name)!!")
    end

    function goodbye(name)
        println("Goodbye $(name)!!")
    end

    function main()
        hello("Julia")
        println("SimpleModule.hoge = ", hoge)
        goodbye("Julia")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .SimpleModule
    SimpleModule.main()
end
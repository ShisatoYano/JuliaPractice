#=
simple_module:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-05
=#

module Greeting
    # define function
    hello(name) = println("Hello $(name)!!")
    goodbye(name) = println("Goodbye $(name)!!")

    # define valuable
    hoge = 2

    # implicitly imported
    export goodbye
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Greeting
    Greeting.hello("Julia")
    println("Greeting.hoge = ", Greeting.hoge)
    goodbye("Julia")
end
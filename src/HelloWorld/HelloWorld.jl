#=
HelloWorld:
- Julia version: 1.4.2
- Author: shisa
- Date: 2020-08-02
=#

function main()
    println("Hello world!!")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

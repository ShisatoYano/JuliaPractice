#=
my_stack:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-18
=#

module MyStack
    # variables
    const stack_size = 100
    stack_num = 0
    stack_data = [0 for i in 1:stack_size]

    function push(n)
        global stack_num
        if stack_num < stack_size
            stack_num += 1
            stack_data[stack_num] = n
            println("Push $(n) : $(stack_data[1:stack_num])")
            return true
        else
            println("Push $(n) : Stack is full")
            return false
        end
    end

    function pop()
        global stack_num
        if stack_num > 0
            pop_data = stack_data[stack_num]
            stack_num -= 1
            println("Pop $(pop_data) : $(stack_data[1:stack_num])")
            return true
        else
            return false
        end
    end

    function main()
        # push 1~10 to stack
        for i in 1:10
            push(i)
        end
        # pop 6 times
        for i in 1:6
            pop()
        end
        # pop until stack become empty
        while stack_num > 0
            pop()
        end
        println("Stack is empty")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .MyStack
    @time MyStack.main()
end
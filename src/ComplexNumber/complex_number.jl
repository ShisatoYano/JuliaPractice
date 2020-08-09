#=
complex_number:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-07
=#

module CompNum
    # expressions
    expr1 = 1 + 2im
    expr2 = 2 - 3im

    # methods
    function get_expr1()
        return expr1
    end

    function get_expr2()
        return expr2
    end

    function multiply(expr1, expr2)
        return expr1 * expr2
    end

    function get_real(expr)
        return real(expr)
    end

    function get_imag(expr)
        return imag(expr)
    end

    function get_conj(expr)
        return conj(expr)
    end

    function get_abs(expr)
        return abs(expr)
    end

    function main()
        expr_1 = get_expr1()
        expr_2 = get_expr2()
        println("Expr1 = ", expr_1)
        println("Expr2 = ", expr_2)
        println("Expr1 * Expr2 = ", multiply(expr_1, expr_2))
        println("Real of expr1 = ", get_real(expr_1))
        println("Imag of expr1 = ", get_imag(expr_1))
        println("Conj of expr1 = ", get_conj(expr_1))
        println("Abs of expr1 = ", get_abs(expr_1))
        println("Real of expr2 = ", get_real(expr_2))
        println("Imag of expr2 = ", get_imag(expr_2))
        println("Conj of expr2 = ", get_conj(expr_2))
        println("Abs of expr2 = ", get_abs(expr_2))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .CompNum
    CompNum.main()
end
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
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .CompNum
    expr1 = CompNum.get_expr1()
    expr2 = CompNum.get_expr2()
    println("Expr1 = ", expr1)
    println("Expr2 = ", expr2)
    println("Expr1 * Expr2 = ", CompNum.multiply(expr1, expr2))
    println("Real of expr1 = ", CompNum.get_real(expr1))
    println("Imag of expr1 = ", CompNum.get_imag(expr1))
    println("Conj of expr1 = ", CompNum.get_conj(expr1))
    println("Abs of expr1 = ", CompNum.get_abs(expr1))
    println("Real of expr2 = ", CompNum.get_real(expr2))
    println("Imag of expr2 = ", CompNum.get_imag(expr2))
    println("Conj of expr2 = ", CompNum.get_conj(expr2))
    println("Abs of expr2 = ", CompNum.get_abs(expr2))
end
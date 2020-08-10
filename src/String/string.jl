#=
string:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-08
=#

module String
    # valuables
    str1 = "Hello Julia"
    str2 = "こんにちは、Julia"

    # methods
    function get_str1()
        return str1
    end

    function get_str1_char(idx)
        return str1[idx]
    end

    function connect_str(str1, str2)
        println("How to connect str1:$str1 and str2:$str2")
        println("Using string(): ", string(str1, " ", str2))
        println("Using *: ", str1 * " " * str2)
        println("Using interpolation: ", "$str1 $str2")
    end

    function get_str2()
        return str2
    end

    function get_str2_unicode(idx)
        return str2[idx]
    end

    function main()
        # normal string and char
        println("str1 = ", get_str1())
        println("str1[1] = ", get_str1_char(1))
        println("typeof(str1[1]) = ", typeof(get_str1_char(1)))
        println("str1[end] = ", get_str1()[end])
        println("str1[1:5] = ", get_str1_char(1:5))
        # unicode string
        println("str2 = ", get_str2())
        # almost Hiragana and Kanji are represented as 3 bytes.
        println("str2[1] = ", get_str2_unicode(1))
        println("str2[4] = ", get_str2_unicode(4))
        # get next index
        println("nextind(str2, 1) = ", nextind(get_str2(), 1))
        println("nextind(str2, 4) = ", nextind(get_str2(), 4))
        # convert string array
        println("Vector{Char}(str2) = ", Vector{Char}(get_str2()))
        println("Vector{Char}(str2)[1] = ", Vector{Char}(get_str2())[1])
        println("Vector{Char}(str2)[2] = ", Vector{Char}(get_str2())[2])
        # string function
        println("length(Julia) = ", length("Julia"))
        println("repeat(Julia, 3) = ", repeat("Julia", 3))
        println("replace(Python is the best!!, Python => Julia) = ", replace("Python is the best!!", "Python" => "Julia"))
        println("split(Julia-lang, -) = ", split("Julia-lang", "-"))
        println("startswith(JuliaLang, Julia) = ", startswith("JuliaLang", "Julia"))
        println("endswith(JuliaLang, Julia) = ", endswith("JuliaLang", "Julia"))
        println("join([Julia, Lang], -) = ", join(["Julia", "Lang"], "-"))
        println("findfirst(Julia, JuliaLang) = ", findfirst("Julia", "JuliaLang"))
        # regular expression
        println("regex = ", r"J.*g")
        println("match(regex, JuliaLang is the best) = ", match(r"J.*g", "JuliaLang is the best").match)
        println("offset(regex, JuliaLang is the best) = ", match(r"J.*g", "JuliaLang is the best").offset)
        connect_str("Goodbye", "Julia")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .String
    String.main()
end
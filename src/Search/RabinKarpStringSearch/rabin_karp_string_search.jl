#=
rabin_karp_string_search:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-09-20
=#

module RabinKarpSearch
    # parameters
    const cardinal = 101

    function get_hash(s, len)
        hash_value = 0
        pow_num = len
        for i in 1:len
            pow_num -= 1
            ascii_num = Int(s[i])
            hash_value += ascii_num * (cardinal^pow_num)
        end
        return hash_value
    end

    function rabin_karp_search(text, pattern)
        println("")
        println("Search $(pattern) from $(text)")

        len_txt = length(text)
        len_pat = length(pattern)

        found = false

        # convert from string to hash value
        hash_txt = get_hash(text[1:len_pat], len_pat)
        hash_pat = get_hash(pattern[1:len_pat], len_pat)

        # search
        for i in 1:(len_txt)
            if hash_txt == hash_pat
                if text[i:i+len_pat-1] == pattern
                    found = true
                    println("Found at index:$(i)~$(i+len_pat-1)")
                end
            end
            # prevent bounds error
            if (i + len_pat) > len_txt
                break
            end
            # calculate next hash value
            hash_txt = hash_txt - (Int(text[i]) * (cardinal^(len_pat-1)))
            hash_txt *= cardinal
            hash_txt = hash_txt + (Int(text[i+len_pat]) * (cardinal^0))
        end

        if found == false
            println("Pattern not found")
        end
    end

    function main()
        @time rabin_karp_search("Hello sunshine", "sun")
        @time rabin_karp_search("GEEKS FOR GEEKS", "GEEKS")
        @time rabin_karp_search("aaaaaaaaaaaaaaaaaaaaaaaaaaaa", "bbb")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    using .RabinKarpSearch
    RabinKarpSearch.main()
end
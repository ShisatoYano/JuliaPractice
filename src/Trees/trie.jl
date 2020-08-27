#=
trie:
- Julia version: 1.5.0
- Author: shisa
- Date: 2020-08-27
=#

# trie node class
mutable struct TrieNode
    children
    is_end
end

function get_node()
    return TrieNode([nothing for i in 1:26], false)
end

function insert(key)

end

function main()
    # input keys
    # use only "a" through "z" and lower case
    keys = ["the", "a", "there", "anaswe", "any", "by", "their"]

    # output
    output = ["Not present", "Present"]

    # init root
    root = get_node()

    # construct trie
    for key in keys
        println(key)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
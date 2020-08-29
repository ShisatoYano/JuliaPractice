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

const alphabet_num = 26

function get_node()
    return TrieNode([TrieNode([], false) for i in 1:alphabet_num], false)
end

function char_to_idx(ch)
    if Int(ch) - Int('a') == 0
        return 1
    else
        return Int(ch) - Int('a')
    end
end

function insert(key)
    # if not present, inserts key into trie
    # if the key is prefix of trie node,
    # just marks leaf node
    p_crawl = root
    len_key = length(key)
    for level in 1:len_key
        idx = char_to_idx(key[level])
        if isempty(p_crawl.children[idx].children) == true
            p_crawl.children[idx] = get_node()
        end
        p_crawl = p_crawl.children[idx]
    end
    p_crawl.is_end = true
end

function search(key)
    p_crawl = root
    len_key = length(key)
    for level in 1:len_key
        idx = char_to_idx(key[level])
        if isempty(p_crawl.children[idx].children) == true
            return false
        end
        p_crawl = p_crawl.children[idx]
    end
    return isempty(p_crawl.children) == false && p_crawl.is_end == true
end

function show_result(flag)
    if flag == true
        return "Present"
    else
        return "Not Present"
    end
end

function main()
    # input keys
    # use only "a" through "z" and lower case
    keys = ["the", "a", "there", "anaswe", "any", "by", "their"]

    println("Input Keys: $(keys)")

    # init root
    global root = get_node()

    # construct trie
    for key in keys
        insert(key)
    end

    # search different keys
    println("Search Key: the = $(show_result(search("the")))")
    println("Search Key: these = $(show_result(search("these")))")
    println("Search Key: their = $(show_result(search("their")))")
    println("Search Key: thaw = $(show_result(search("thaw")))")
    println("Search Key: answer = $(show_result(search("answer")))")
    println("Search Key: by = $(show_result(search("by")))")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
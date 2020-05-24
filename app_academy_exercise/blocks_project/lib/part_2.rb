require "byebug"

def all_words_capitalized?(arr)
    # 这个题有简洁的办法，用 capitalize 函数直接出来
    # arr.all? { |word| word.capitalize == word}
    
    arr.all? do |word|
        formal(word) == true
    end
    
end

def formal(words)
    words.each_char.with_index do |char, i|
        if words[0] == words[0].upcase && words[1..-1] == words[1..-1].downcase
            return true
        end
    end
    false
end

def no_valid_url?(arr)
    # 这个题有简洁的办法，用 end_with? 函数直接出来
    # arr.none? do |web|
    #    web_last.any? { |ending| web.end_with?(ending)}
    #end
    
    arr.none? do |web|
        include_url?(web)
    end
end

def include_url?(url)
    web_last = [".com", ".net", ".io", ".org"]
    web_last.each do |ele|
        if url.include?(ele)
            return true
        end
    end
    false
end

def any_passing_students?(arr)
    arr.any? do |students|
        students[:grades].sum / students[:grades].length >= 75
    end
end
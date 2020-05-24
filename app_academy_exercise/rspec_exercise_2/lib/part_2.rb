require "byebug"

def palindrome?(str)
    reversed = ""
    
    (0...str.length).reverse_each do |i|
        reversed += str[i]
    end

    reversed == str
end

def substrings(word)
    subs = []

    (0...word.length).each do |start_idx|
        (start_idx...word.length).each do |end_idx|
            subs << word[start_idx..end_idx]
        end

    end

    subs
end

def palindrome_substrings(str)
    possible = substrings(str)
    res = []

    possible.each do |word|
        res << word if palindrome?(word) 

    end
    res.select { |ele| ele.length > 1}
end
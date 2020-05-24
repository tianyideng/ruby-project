def substrings(word)
    char = word.split("")

    char.inject do |res, ele| 
        res + ele
        
    end


end

p substrings("jump")
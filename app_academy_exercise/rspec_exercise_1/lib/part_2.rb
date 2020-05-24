def hipsterfy(str)
    arr = []
    new_word = ""
    
    begin 
        str.each_char.with_index do |char, i|
            if "aeiou".include?(char)
                arr << i
            end

        end
        
        new_word = str[0...arr.max] + str[arr.max + 1..-1]
    rescue
        return str
    end
end

def vowel_counts(str)
    count = Hash.new(0)

    str.each_char do |char|
        if "aeiou".include?(char.downcase)
            count[char.downcase] += 1
        end
    end
    count

end

def caesar_cipher(str, num)
    alph = "abcdefghijklmnopqrstuvwxyz"
    word = ""
    str.each_char do |char|
        if alph.include?(char)
            index = alph.index(char)
            new_char = alph[(index + num % 26) % 26]
            word += new_char
        else 
            word += char
        end
    end
    word
end


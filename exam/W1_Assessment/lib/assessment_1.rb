def my_map!(arr, &block)
    arr.each_with_index { |ele,i| arr[i] = block.call(ele)}
    
end


def two?(arr, &block)
    count = arr.count { |ele| block.call(ele) } 
    count == 2
    
end

def nor_select(arr, proc1, proc2)
    arr.select { |ele| !proc1.call(ele) && !proc2.call(ele)}
end

def array_of_hash_sum(hashes_array)
    hashes_array.sum { |hash| hash.values.sum}
end

def removeFirstVowel(word)
    (0...word.length).each do |i|
        return word[0...i] + word[i+1..-1] if "aeiou".include?(word[i])
    end
    word
end
​
def slangify(sentence)
    words = sentence.split.map {|word| removeFirstVowel(word)}
    words.join(" ")
end

def char_counter(str, *chars)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1}

    if chars.empty?
        return count
    else
        chars.each { |char| count[char] = count[char] }
    
        count.select { |char, e| chars.include?(char) }
    end
end
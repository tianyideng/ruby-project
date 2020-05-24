require "byebug"

def partition(arr, num)
    first_arr = []
    second_arr = []
    res = []

    arr.each do |ele|  
        if ele < num
            first_arr << ele 
        else 
            second_arr << ele 
        end

    end

    res << first_arr
    res << second_arr
end

def merge(hash1, hash2)
    
    res = hash1.merge(hash2)
    
end

def censor(str, arr)
    words = str.split(" ")
    temp_arr = []

    words.each do |ele|
        if arr.include?(ele.downcase)
            temp_arr << word_vowels(ele)
        else
            temp_arr << ele
        end

    end

    temp_arr.join(" ")
end

def word_vowels(word)
    vowels = "aeiou"
    new_word = ""

    word.each_char do |char|
        if vowels.include?(char.downcase)
            new_word += "*"
        else
            new_word += char
        end

    end

    new_word
end

def power_of_two?(num)
    base = 1
    
    while base < num
        base *= 2
    end

    base == num
end
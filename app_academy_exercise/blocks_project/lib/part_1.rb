require "byebug"

def select_even_nums(arr)
    arr.select(&:even?)

end

def reject_puppies(arr)
    arr.reject do |dogs|
        dogs["age"] <= 2
    end
end

def count_positive_subarrays(arr)
    arr.count do |subarr|
        subarr.sum > 0
    end     
    
end

def aba_translate(str)
    res = []

    str.split("").each do |char|
        if "aeiou".include?(char)
            res << char
            res << "b"
            res << char
        else  
            res << char
        end
    end

    res.join("")
end

def aba_array(arr)
    arr.map do |word|
        aba_translate(word)
    end

end



def reverser(str, &prc)
    new_str = ""
    (0...str.length).each do |i|
        new_str = str[i] + new_str
    end
    prc.call(new_str)
end

def word_changer(str, &prc)
    word = str.split(" ")

    new_word = word.map(&prc)
    new_word.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    arr = [prc1.call(num), prc2.call(num)]
    arr.max
end

def and_selector(arr, prc1, prc2)
    res = []
    arr.select do |ele|
        if prc1.call(ele) && prc2.call(ele)
            res << ele
        end
    end

    res
end

def alternating_mapper(arr, prc1, prc2)
    res = []
    arr.each_with_index do |ele, i|
        if i.even?
            res << prc1.call(ele)
        else 
            res << prc2.call(ele)
        end 
    end
            
    res
end
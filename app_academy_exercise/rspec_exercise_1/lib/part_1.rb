def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(num)
     num.sum / (num.length * 1.0)
    

end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
    new_sent = []
    words.map.each_with_index do |ele, i|
        if i.even?
            new_sent << ele.upcase
            
        else 
            new_sent << ele.downcase
        end
    end
    new_sent.join(" ")
end
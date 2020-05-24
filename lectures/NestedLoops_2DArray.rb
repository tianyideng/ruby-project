## while, each 都是loop

(1..3).each do |num1|
    puts num1

    (1..5).each do |num2|
        puts "    " + num2.to_s ##to string 
    
    end
end


(1..3).each do |num1|
    

    (1..5).each do |num2|
        puts num1.to_s + "    " + num2.to_s ##to string 
    
    end
end

#Nested Loops
arr = ["a", "b", "c", "d"]

# below we iterate through all possible w/ duplicates
arr.each do |ele1|
    arr.each do |ele2|
        puts ele1 + ele2
    end

end   

# below we iterate through only unique possible
# if idx2 greater than idx1, the idx2 is never referring to what idx1 referred to previously
arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
        if idx2 > idx1
            puts ele1 + ele2
            puts idx1.to_s + "  " + idx2.to_s
            puts "-------"
        end
       
    end

end  

## 2-d Arrays
arr = [
    "I", 
    "am", 
    "hungry"
]

arr = [
    ["a", "b", "c"], 
    ["d", "e"], 
    ["f","g", "h"]
]
puts arr
puts
print arr
print arr[0]

subArr = arr[0]
print subArr[0]  
print arr[0][0] #两个结果一样

arr.each do |subArr|
    print subArr
    puts
    subArr.each do |ele|
        puts ele
    end
end    
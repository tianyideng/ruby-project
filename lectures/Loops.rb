# while loops

def repeatHello()

    puts "before the loop"
    counter = 1
    while counter <= 5  #循环的条件, 一直是true满足条件就一直运行，当false了就停止运行
        puts "hello"  #循环的内容 
        
        counter += 1
    end   
    
    puts "after the loop"

end

repeatHello()

# while loops 2

def printNums
    i = 0
    while i < 4  #如果条件永远不会false，那就会变成死循环，无限下去
        puts i

        i += 1
            
    end

end

printNums()

# while loop 3

def printNums(min, max, step) #加入参数 parameters
    i = min
    while i < max  
        puts i

        i += step
            
    end

end

printNums(1, 5, 1)

# iterating through string with loops

str = "hello"
puts str[0]
puts str[1]
puts str[4]

#逐一打印出每个index对应的值
str = "hello"

i = 0
while i < str.length
    puts str[i]

    i += 1
end

#fancy loops
def printChars(str)

    i = 0
    while i < str.length
        puts str[i]

        i += 1
    end
end

printChars("hello")

#break - immediately exit the loop
#next - skips to the next iteration, 跳过下一个返回上面的
i = 1
while i <= 10
    puts i
    if i == 5
        break   
    end
    puts i
    i += 1
end

puts "loop end"


def sum_nums(max)
    i= 1
    sum = 0
    while i <= max
      sum = sum + i
    
      i += 1
  
    end 
    return sum
  end
  
  puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
  puts sum_nums(5) # => 15
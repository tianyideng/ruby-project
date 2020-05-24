#defining a method
def sayMessage
    puts "hey!"
    puts "what's up!"

end    

#use/call method 
puts "before the method call"
sayMessage
puts "after the method call"

#method 2 参数 parameters
def say_hello(person) #person is varible/参数
    puts "hello" + person + "."
end    

say_hello("Mike")

def say_hello(person1, person2) #person is varible/两个参数
    puts "hello" + person + "and" + person2 + "."
end    

say_hello("Mike", "Lily")

#method3 returen values
def calc_average(num1, num2)
    sum = num1 + num2
    avg = sum / 2.0
    return avg #改成 return 

end    

#the return keyword lets a method call evaluate to a value
result = calc_average(5, 10)  #新赋值给一个variable 叫做result
puts result + 1


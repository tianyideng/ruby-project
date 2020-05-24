#Conditionals

num = 42

if num > 0 #条件从句
    puts "positive"
else  #否则
    puts "negative"   
end    

#Conditionals 2

num = 0

if num > 0 #条件从句
    puts "positive"
elsif  num < 0 #条件 2
    puts "negative"   
else
    puts "it is zero!"    
end   

#Conditionals 3  two chains

num = 8

if num > 0
    puts "positive"
end    

if num % 2 == 0
    puts "even"
end  

# else or els makes the conitions exclusive
if num > 0
    puts "positive"
elsif num % 2 == 0  #只会显示一个条件的结果，因为电脑只走1个条件，只选其一
    puts "even"
end  

#Write a method either_only(number) that takes in a number and returns true 
#if the number is divisible by either 3 or 5, ###but not both###. The method should return false otherwise.

def either_only(number)
    if (number % 3 == 0 || number % 5 == 0) && ! (number % 3 == 0 && number % 5 == 0)
      return "true"
    else
      return "false"
    end
end
  
  puts either_only(9)  # => true
  puts either_only(20) # => true
  puts either_only(7)  # => false
  puts either_only(15) # => false
  puts either_only(30) # => false

  #answer 2
  def either_only(number)
    if (number % 3 == 0 && number % 5 != 0) || (number % 3 != 0 && number % 5 == 0) 
      return "true"
    else
      return "false"
    end
  end
  
  puts either_only(9)  # => true
  puts either_only(20) # => true
  puts either_only(7)  # => false
  puts either_only(15) # => false
  puts either_only(30) # => false
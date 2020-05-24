# Input
使用gets来进行用户交互行为，gets代表需要用户填写的地方。
注意每次gets返回的结果都会自带“\n”，因为这个代表着回车，每次用户输入答案后都会回车，所以会自带。解决这个问题只需加入.chomp 即可，这代表着去掉新的一行的“\n”。
```
puts "Enter 'yes' or 'no'"

response = gets.chomp

if response == "yes"
  puts "yup!"
elsif response == "no"
  puts "nah!"
else
  puts "I'm sorry, my responses are limited."
end
```
如果要输入数字，则需要.to_i，因为gets返回的值基本都是string。
```
numeric_string = "42"
p numeric_string      # "42"
p numeric_string.to_i # 42

# 所以要这么写：
puts "Enter a number: "
num = gets.chomp.to_i
puts 2 * num
```

## Require Files
有些时候我们有很多个class需要写，那我们可以把classes分开成不同的files，然后建立一个file来connect with all classes，这时候在这个文件里就需要require files。Require的逻辑结构：
```
project_root
  ├── pet_hotel.rb
  ├── cat.rb
  └── other_animals
      └── dog.rb
```
Require的书写方式 require_relative + “路径”。同一个文件夹的话就用“.”代替即可。
```
require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"
```
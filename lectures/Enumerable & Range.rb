# Array.push 在Array最后面可以加入elements，不止一个哦。 <<只能加一个element
arr = ['1', "2", "3"]
arr.push("555", "666")
#Array.pop() 摘掉并return最后一个element 就一个
arr = ['1', "2", "3"]
arr.pop() #可以不加括号也能call


# Array.unshift 在最前面加入elements
arr = ['1', "2", "3"]
arr.unshift("888")
print arr
# Array.shift 摘掉最前面的一个element，应该就一个
arr = ['1', "2", "3"]
arr.shift()
print arr
puts

# Array/String.Index(ele) 查找对应的元素的index
arr = ['SF', "NY", "LA"]
puts arr.index("NY")
puts

str = "hello"
puts str.include?("ell") #只显示第一个字母所在的index，是substr


# Array/String.Include?(ele)  返回boolean，看看元素是否在里面
arr = ['SF', "NY", "LA"]
puts arr.include?("NY")
puts

str = "hello"
puts str.include?("e") #大小写会识别


# reverse 
arr = [1, 2, 3, 4]

print arr.reverse #只改变version，原arr不变化
arr.reverse! # reverse an array/string in place， arr被改写了。

# Slicing 切割，range
# 1..-1 (-1是最后一位，-2是倒数第二个)
arr = [1, 2, 3, 4]
print arr[1..3] # 1, 2, 3
print arr[1...3] # 1, 2

# Split & join (每个element之间加/分开), str不能直接join
str = "follow the yellow brick road"
print str.split(" ") #space split, split后 space也没有了, str split之后会变成array
print str.split("l").join("Z") #array join后会变成string

###### Enumerable ####### 可列举的
#arr.each 迭代
months = ["jan", "feb", "mar", "apr"]
months.each { |ele| puts ele }  ##和while循环迭代一样，记住用{}去写参数，ele是指自己命名的variable。

##while循环这么写
i = 0
while i < months.length
    ele = months[i]
    puts ele
    i += 1
end

# do 迭代这么写, 也是each，只不过用 do 和 end代替了大括号{}
months.each do |ele|
    puts ele
    puts "-------"
end

# str.each_char 
sentence = "hello world"
sentence.each_char do |char|
    puts char
end

#arr.each_with_index 带上index
months = ["jan", "feb", "mar", "apr"]
months.each_with_index do |ele, idx|
    puts ele
    puts idx
    puts "-----"
end

# str.each_char.with_char 带上idex
sentence = "hello world"
sentence.each_char.with_index do |char, idx|
    puts char
    puts idx
    puts "----"
end

#圆括号 parentheses 用来代表range，参数等
arr = [1, 2, 3, 4, 5]
arr.each { |num| puts num}
#用range来表示一样可以
(1..5).each { |num| puts num}

##fizzbuzz
def fizzBuzz(max)
    arr = []
    (1...max).each do |num|
        if (num % 3 == 0 || num % 5 == 0) && ! (num % 3 == 0 && num % 5 == 0)
            arr << num
        end
    end

    return arr
end

print fizzBuzz(20)

#前面的range类似于计数器，每走一次，播放一遍hello，最后返4个hello
(0...4).each { puts "hello"}
#可以直接用 times来表示计数
4.times { puts "hi"}

5.times { |num| puts num} #注意如果是这样就是从0开始

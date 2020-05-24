# if从句尽量写在一行里，有点像英语。
```
raining = true
# Less preferred
if raining
    puts "don't forget an umbrella!"
end

## Preferred by a Rubyist 就像这样写
puts "don't forget an umbrella!" if raining
```
# 有些condition可以直接用function表示，比如判断偶数，选取最后一个等。
```num = 6

## Less preferred
p num % 2 == 0

## Preferred by a Rubyist
p num.even?

people = ["Joey", "Bex", "Andrew"]

## Less preferred
p people[people.length - 1]

## Preferred by a Rubyist
p people[-1]
p people.last
```
# 有些迭代的循环可以折叠，用function来代替，比如.times(), .all?()
```
## Less preferred
def repeat_hi(num)
    i = 0
    while i < num
        puts "hi"
        i += 1
    end
end

## Preferred by a Rubyist
def repeat_hi(num)
    num.times { puts "hi" }
end
## Less preferred
def all_numbers_even?(nums)
    nums.each do |num|
        return false if num % 2 != 0
    end

    true
end

## Preferred by a Rubyist
def all_numbers_even?(nums)
    nums.all? { |num| num.even? }
end
```
# Common Enumerables Notes常用可例举的循环
## all? 所有的都是吗
```
p [2, 4, 6].all? { |el| el.even? }  # => true
p [2, 3, 6].all? { |el| el.even? }  # => false
```
## any? 有一个就行
```
p [3, 4, 7].any? { |el| el.even? }  # => true
p [3, 5, 7].any? { |el| el.even? }  # => false
```
## none? 是不是全部都没有
```
p [1, 3, 5].none? { |el| el.even? } # => true
p [1, 4, 5].none? { |el| el.even? } # => false
```
## one? 仅有一个符合
```
p [1, 4, 5].one? { |el| el.even? }  # => true
p [1, 4, 6].one? { |el| el.even? }  # => false
p [1, 3, 5].one? { |el| el.even? }  # => false
```
## count 计数
```
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }             # => 0
```
## sum 求和
```
p [1, -3, 5].sum   # => 3
```
## max min 最大最小， 可以nil
```
p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil
```
## flatten 多矩阵的array可以复合成一元的array
```
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]
```
## Rand() Random method 随机选数
```
#在指定范围内给一个随机的数
rand(0..10)
```
## method.sample 在method里随机选取一个样本
```
arr = ["dog", "cat", "monkey"]
arr.sample #=> "dog"（随机选）
```

# Symbols 特有的数据结构
用冒号来表示 “：”
## immutable，不可改变，string可以改
```
str = "hello"
sym = :hello

str[0] = "x"
sym[0] = "x"

p str   # => "xello"
p sym   # => :hello
```
## memeory小，更有效，因为不可变
## 用于 hash keys，可以简写，不用写=>了
```
my_bootcamp = { name:"App Academy", color:"red", locations:["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red 但是这里依旧是要用冒号在前面
```
# Default Arguments 参数默认值
## 可以以防没有给予参数值的时候默认一个值
```
# Let's make num an optional parameter.
# By default, num will have the value of 1
def repeat(message, num=1)
    message * num
end

p repeat("hi") # => "hi"
p repeat("hi", 3) # => "hihihi"
```
## 可以用来占位
```
def greet(person_1="default", person_2)
    p person_1 + " and " + person_2
end

greet("Chao") # => "default and Chao"
```
## 很多情况 Hash.new(“!!!”) 这种 也算是default了。
# Option Hashes
用hash做参数时，可以省略大括号
```
def modify_string(str, options)
    str.upcase! if options["upper"]
    p str * options["repeats"]
end

# less readable
modify_string("bye", {"upper"=>true, "repeats"=>3}) # => "BYEBYEBYE"

# more readable
modify_string("bye", "upper"=>true, "repeats"=>3)   # => "BYEBYEBYE"
```
# Splat （*）参数
## 折叠参数（可扩展）
```
def method(arg_1, arg_2, *other_args) #这里折叠了几个参数。
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end

method("a", "b", "c", "d", "e") #所以前两个参数后的所有参数都算作折叠里面的。
```
## 拆分Array （Decompose）
```
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper" # 没有splat的话就会报错，因为没被拆开就视为一个参数。
```
## 拆分Hash
```
old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}
```
# Inject Notes 注入参数
和each不同的是，each返回的是数本身，inject返回的是计算后的累计。
例如数字求和、求乘。使用一个argument和block, 对于这个array中包含的每一个element,这个block将会执行一次，最后返回最后一个block的值。
```
p [11, 7, 2, 4].inject { |acc, el| acc + el } # => 24 #acc就是第一个，el就是下一个
```
## 可设定default accumulator，提前赋值
```
p [11, 7, 2, 4].inject(100) { |acc, el| acc + el } # => 124
```
## 复杂一点可以套入conditionals
```
[11, 7, 2, 4].inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end # => 6
```
**注意**
inject 里面的每一层里的所有要求都会被返还出下一层的accumulate，所以想要获取每一层的值，是几乎不可能的（也许以后知道怎么获取）。所以使用 inject 的时候，尽量只取最后的结果。
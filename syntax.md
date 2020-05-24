# Ruby 里遇到的一些简写方式
1. 括号可以省略，如果用空格的话，例如
```
"aeiou".include?("e")
"aeiou".include? "e"
#############################
cat_1.age=(42)
cat_1.age = 42
```
2. 在同一个block里，&:method 是一种简写，如果每个参数都要执行这个method的话。相当于省略了大括号和设定一个参数，直接运行block。
```
["a", "b", "c"].map { |str| str.upcase }  #=> ["A", "B", "C"]
[1, 2, 5].select { |num| num.odd? }       #=> [1, 5]
############# 简写 变身 #######################
["a", "b", "c"].map(&:upcase) #=> ["A", "B", "C"]
[1, 2, 5].select(&:odd?)      #=> [1, 5]
```
3. 参数里包含block的时候，可以写在圆括号外面
4. method！ 一般表示这个method就固定了，类似于map
```
def modify_string(str, options)
    str.upcase! if options["upper"]
    p str * options["repeats"]
end
```
5. #{} , 在string里面注入method的值
```
number = 42
"My favorite number is #{ number }!!!"
#=>My favorite number is 42!!!
```
## Spaceship Operator <=> 判断大小
1代表大，0代表相等，-1代表小。
```
7 <=> 2     # => 1
7 <=> 7     # => 0
2 <=> 7     # => -1
10 <=> 2    # => 1
-5 <=> 10   # => -1
-3 <=> -9   # => 1
```


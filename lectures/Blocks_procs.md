# Blocks 块
1. 块我们已经用过了，类似一些循环方法，each，map，times等。
2. 一般来说我们用{}的里面就是块，或者 do...end 也是。
3. 注意的是块和method很像，但是return可以帮助我们区分：
```
# Correct:
def double_eles(arr)
  arr.map do |ele|
    ele * 2
  end
end
double_eles([1,2,3]) #=> [2,4,6]


# Incorrect:
def double_eles(arr)
  arr.map do |ele|
    return ele * 2
  end
end
double_eles([1,2,3]) #=> 2
```
## Using method as Blocks
很多时候我们会套用method在块里，这样我们可以简写为 &:method。例如：
```
["a", "b", "c"].map { |str| str.upcase }  #=> ["A", "B", "C"]
[1, 2, 5].select { |num| num.odd? }       #=> [1, 5]

["a", "b", "c"].map(&:upcase) #=> ["A", "B", "C"]
[1, 2, 5].select(&:odd?)      #=> [1, 5]
```
# Procs 过程（包含blocks）
procs 是个object。很多时候我们想要variable包含blocks，这个时候我们可以用procs去操作。我们可以这样想，proc就像个包装纸，把block包起来了，这样就变成了object。
```
double = Proc.new { |num| num * 2 }
p double.call(3)
```
使用Proc.new 去创建， 用call去使用。接下来我们看一个mix method的例子：
```
def add_and_proc(num1, num2, prc)
    sum = num1 + num2
    prc.call(sum)
end

double = Proc.new { |num| num * 2 }
p add_and_proc(2, 3, double) #=> 10
```
## 区分Block & Procs
我们可用 & 符号来转换block和proc，如果转换成block了，那需要对应的输入block，proc就不行。
```
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # ArgumentError: wrong number of arguments (given 3, expected 2)

###或者这个例子也不对
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # Error

```
another example，建立好proc后，运用block
```
[1,2,3].map { |num| num * 2 } # => [2, 4, 6]
##可以这样写
doubler = Proc.new { |num| num * 2 }
[1,2,3].map(&doubler) # => [2, 4, 6]
```




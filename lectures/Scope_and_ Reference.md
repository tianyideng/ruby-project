# Bubble Sort
气泡排序，把最大的数像气泡一样，漂浮到最上面。从index 0开始两两对比，把最大element的移到最后。
```
def bubble_sort(arr)
    sorted = false

    while !sorted
        sorted = true

        #做一轮排序：
        (0...arr.length - 1).each do |i|
            if arr[i] > arr[i + 1] #只有乱序的时候才会出现这种情况
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                sorted = false #因为乱序，所以false
            end
        end
    end
    
    arr
end

arr = [2, 8, 5, 2, 6]
p bubble_sort(arr) # =. [2, 2, 5, 6, 8]
```
# Global Varibles 全局变量
这里涉及到Scope的知识点，一般来说我们会有lexical scope （词汇范围），出了范围的variables不会被识别出来
## Scope
```
def say_hello
    message = "hello"
end

say_hello
p message   # NameError: undefined local variable
## 这样也会出错，也是出了范围
message = "hi"

def say_hello
    p message   # NameError: undefined local variable
end

say_hello
```
所以我们可以用global Variables去打破scope范围, cross in different variables
```
$message = "hello globe"

def say_hello
    p $message
end

say_hello # => "hello globe"
```
# Constants 常数，不可变
用全部大写来常数创建Variable时候，是常熟，基本不可以被再次赋值的，但是可以改里面的elements。相当于不可以reassign，但是可以mutate/changed。
```
FOOD = "pho"
p FOOD # => "pho"

FOOD = "ramen"  #warning: already initialized constant FOOD
                #warning: previous definition of FOOD was here
# 可以这么改elements
FOOD = "pho"
FOOD[0] = "P"
p FOOD # => "Ph
```
Constants 的 scope 也是全局的
```
FOOD = "pho"
$drink = "ice coffee"

def my_favorite
    p FOOD
    p $drink
end

my_favorite
```
# 无作用域 No Scope
Block 没有作用域
```
def say_bye
    message = "bye"

    3.times do 
        p message
    end
end

say_bye
```
条件从句和循环也没有自己的作用域，所以在从句外也可以调用variable
```
if true
    drink = "cortado"
end

p drink
```
# Reference & Value
每个Variable在建立的时候都会对应一个Value和一个Reference
```
word1 = "boot"
word1.object_id 
word2 = "boot"
#即使value一样，但是word1 和 word2是两个地址memory address
```
可以两个Variable用一个Reference
```
word1 = "cat"
word2 = word1
#这种情况两个word的地址是一个，如果word1改变了value，word2的value也改变，但是地址不变
```
如果Variable的Value变化了，reference不会变，但如果重新Assign了的话，reference会变化
```
str = "hello"
str.object_id 

str = "bye"
#reassign的话地址会变,仅改变Value的话不会变reference
```
```
arr = [] #=> []
arr = Array.new(3) #=> [nil, nil, nil]
arr = Array.new(3, 0) #=> [0, 0, 0]
arr[0] = 1 #=> [1, 0, 0]
```
Reference 混淆的话会造成的错误案例：
```
#建立了一个2D Array (3x3), 但是3个sub-Array全部是一样的，因为是一个reference。
grid = Array.new(3, Array.new(3)) 
grid[0][0] = "X" #=> [["X", nil, nil], ["X", nil, nil], ["X", nil, nil]]
#这是犯错了的
```
正确的建立不同reference的2D Array要这样做，用{}去建立Sub-Array
```
grid = Array.new(3) { Array.new(3) }
grid[0][0] = "X" #=> [["X", nil, nil], [nil, nil, nil], [nil, nil, nil]]
```
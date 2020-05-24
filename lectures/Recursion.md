# Recursion 递归
像两面镜子互照一样，镜子里还有镜子，还有你。自己里面有自己，以此类推。
举例：
```
# recursive method definition:
def say_hello
  p "hello"
  say_hello
end

say_hello # prints "hello" forever
```
```
def count_down(num)
  if num == 0
    p "Houston, we have lift-off!"
    return;
  end

  p num
  count_down(num - 1)
end

count_down(10)  # prints numbers from 10 to 1, and finally "Houston, we have lift-off!"
```

## 利用递归去写factorial（阶乘）
以前用loop来写的话是这样的：
```
def factorial(num)
  multiple = 1
  i = 1
  while i <= num
    multiple *= i
    i += 1
  end
  return multiple
end

puts factorial(3) # => 6, because 1 * 2 * 3 = 6
puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120
```
用阶乘就这么写：
```
def factorial(n)
    return 1 if n == 1

    n * factorial(n - 1)
end
```
```
factorial(5) = 5*4*3*2*1
factorial(4) = 4*3*2*1
factorial(3) = 3*2*1
factorial(2) = 2*1
factorial(1) = 1
```
注意递归返回的值，会返回到上一层递归。所以return 1，不代表整个method返回值为1.

## 用递归方法解决 fibonacci sequence
以前用loop的方法是：
```
def fibonacci(length)
  if length == 0
    return []
  elsif length == 1
    return [1]
  end
  
  seq = [1, 1]
  while seq.length < length
    last = seq[-1]
    second_last = seq[-2]
    fib = last + second_last
    seq << fib
    
  end
  return seq
end

```
用递归是：
```
# fib(5) = fib(4) + fib(3)
# fib(4) = fib(3) + fib(2)
# fib(3) = fib(2) + fib(1)
# fib(2) = 1 base case
# fib(1) = 1 base case

def fib(n)
  return 1 if n == 1 || n == 2
  fib(n - 1) + fib(n - 2)
end
```

## upcase 如果每次只能大写一个字母的话（这个题出的不make science）
Loop写法：
```
def upcase(str)
  str.each_char.inject("") do |upcased_str, char|
    upcased_str << char.upcase
  end
end
```
```
def upcase(str)
  return str.upcase if str.length <= 1
  str[0].upcase + upcase(str[1..-1])

end
```
## reverse
Loop写法
```
def reverse(str)
  res = ""
  str.each_char do |ele|
    res = str[ele] + res
  end
  res
end
```
```
return str if str.length <= 1
str[-1] + reverse(str[0..-2])
```
## quick_sort
Loop写法
```
def bubble_sort(array)
    sorted = false
    while !sorted
        sorted = true

        (0...array.length - 1).each do |i|
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                sorted = false
            end
        end
    end

    array
end
```
```
def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr[0]]
  left_side = arr[1..-1].select{ |el| el < arr[0] }
  right_side = arr[1..-1].select{ |el| el >= arr[0] }
  quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end





# TDD Test Driven Development 检测驱动开发
就是为了测试代码写得对不对，全不全。需要以四个步骤来做一次迭代。
## 1. Write a new test 写几个测试
## 2. Run all tests & check for fail 跑测试并且看哪错了
## 3. Make changes to the method to satisfy the tests 根据测试需求把代码改好
    这里注意不需要改额外的代码，只要把测试中出现的问题都解决即可。因为之后还会再来几轮测试，慢慢把代码写好。
## 4. Run all tests & check for pass 跑过所有测试，然后再出test
# RSpec 
全自动的测试库，一般使用/lib 和 /spec（测试的缩写 specification）两个组成。比如下面有add和prime两个method需要测试。
```
/example_project
  ├── lib
  │   ├── add.rb
  │   └── prime.rb
  └── spec
      ├── add_spec.rb
      └── prime_spec.rb
```
接下来我们看个例子，测试add这个method：
```
# /spec/add_spec.rb

require "add" # this line will include code from "/lib/add.rb"

describe "add method" do
  it "should accept two numbers as arguments" do
    expect { add(2, 3) }.to_not raise_error
  end

  it "should return the sum of the two numbers" do
    expect(add(2, 3)).to eq(5)
    expect(add(10, 12)).to eq(22)
  end
end
```
看起来像英语，describe表示对某个method的解释，里面包含it，expect。每个it后面是一个test，expect后面是具体的内容。我们来先看第一个it：
```
it "should accept two numbers as arguments" do
  expect { add(2, 3) }.to_not raise_error
end
```
这个测试的意思是：when we call the add method and pass it two number arguments like 2 and 3, it should not get an error. 我们调用add时，期待pass两个numbers作为参数，并且不会得到错误报告。
我们再来看第二个it：
```
it "should return the sum of the two numbers" do
  expect(add(2, 3)).to eq(5)
  expect(add(10, 12)).to eq(22)
end
```
在这里，eq is short for "equal"，测试的意思是：if we pass the add method 2 and 3 as arguments, it should return the sum, which is equal to 5. 如果我们输入两个数作为参数，会得到合计，等于5.
# Exceptions 异常情况
有时候会有报错等情况，例如：
```
def my_method(arg_1, arg_2)
  puts arg_1
  puts arg_2
end

my_method("a") # ArgumentError: wrong number of arguments (given 1, expected 2)
```
```
5 + nil # TypeError: nil can't be coerced into Integer
```
## Handling Exceptions 解决异常 (Rescue 营救)
运用 begin...rescue 来写。举例，下面的例子是报错的：
```
num = 0

10 / num # ZeroDivisionError: divided by 0

puts "finished"
```
可以用 begin ... rescue 来解决
```
num = 0

begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue
  puts "There was an error with that division."
end

puts "--------"
puts "finished"
```
## Raising Exceptions  引出异常，发现异常
instance_of?(string) 判断数据类型。很多情况下，判断出数据类型会发现错误在哪，这样写method的时候可以用条件从句把所有情况考虑进去。
```
def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

format_name("grace", "hopper") # => "Grace Hopper"
format_name(42, true)          # => RuntimeError: arguments must be string
```
## Combine Handling Exceptions && Raising Exceptions
使用 raise if 来澄明。
```
def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

first_name = 42
last_name = true
begin
  puts format_name(first_name, last_name)
rescue
  # do stuff to rescue the "arguments must be strings" exception...
  puts "there was an exception :("
end
```


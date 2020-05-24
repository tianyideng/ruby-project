#symbol
sym = :hello
#immutable - cannot change
#memory is mutable too, small memory, more efficient

### hash key in symbol
bootcamp = {name:"App Academy", color: "red"}
bootcamp[:name]
puts"------"
puts
# 参数里可以先设定default值，这样如果没有赋值时，就取default值
def repeat(str, n=1)
    p str * n
end

repeat("hi", 3)
repeat("hi")

#hash 可以省略括号，如果提前参数
def print_h(hash)
    p hash
end
print_h("city"=> "ny", "color"=>"red")

# more arguments than 2, using *
def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end

method("a", "b", "c", "d", "e") 
## Using splat to decompose an array
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper"

### * will remove the brackets ([]) that enclose the array
arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
arr_3 = [ *arr_1, "c", *arr_2 ]
p arr_3 # => ["a", "b", "c", "d", "e"]
### hash use ** to remove the {}, 只能key是symbol时候用 **
hash = { a:1, b:2 }
new_hash = { **{ a:1, b:2}, c:3, d:4 }
p new_hash

###inject
p [11, 7, 2, 4].inject { |acc, el| acc + el } # => 24

p [11, 7, 2, 4].inject { |acc, el| acc * el } # => 616

p [11, 7, 2, 4].inject do |acc, el|
    if el < acc
        el
    else
        acc
    end
end # => 2

#inject with default
# FIRST ITERATION:
# acc = 100
# el = 11
# new_acc = 111
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }

[11, 7, 2, 4].inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end # => 6
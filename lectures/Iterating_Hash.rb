#hash enumerables
pizza = {
    "style" => "NY", 
    "slices" => 8, 
    "diameter" => "15 inches", 
    "topping" => ["mushrooms", "green peppers"], 
    "is_tasty" => true
}

pizza.each do |k, v|
    puts k
    puts v
    puts "-----"

end  
puts
# enumerable each key
pizza.each_key do |k|
    puts k
end
puts

# enumerable each value
pizza.each_value do |v|
    print v
end
puts

### hashes counter
my_hash = { "a" => 28}
puts my_hash["b"] #没有任何结果，因为b这个key不在hash里面
# nil
puts my_hash["b"] == nil # nil表示noting， emptiness，所以会返回true
puts
# 设置一个default value，这样没有的值就返回这个default
default_hash = Hash.new("xxx")
default_hash["a"] = "goodbye"
puts default_hash
puts default_hash[2]
puts

# use hash to count elements of a string
counter = Hash.new(0) #利用 hash.new 建立一个空的hash，设置default为0，这样可以计数
str = 'bootcamp prep'
str.each_char do |char|
    puts char
    counter[char] += 1  #counter是个hash， hash[key]代表寻找key对应的value。如果没有key就自动建立了，+= 1 就开始计数
                        # hash[variable] 也是一样可行的，variable随着变化
    puts counter
end

## hash counter 2
str = "mississippi river"
count = Hash.new(0)
str.each_char do |char|
    count[char] += 1
end
puts count

#sort by most frequence char
sorted = count.sort_by { |k,v| v} #以v为主去排序,从小到大顺序 ###sort之后变成array了###
print sorted[-1] #最多次数的，返回是一个pair ["i", 5]
print sorted[-1][0] #只返回其 key (array可以用多个中括号确定index)
puts "-----"
## nil
array = ["a", "b", "c"]
p array[100]

hash = {
    "style" => "NY", 
    "slices" => 8, 
    "diameter" => "15 inches", 
    "topping" => ["mushrooms", "green peppers"], 
    "is_tasty" => true
}
p hash[2]
p hash[100]
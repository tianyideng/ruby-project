# hashes
# key ==> value (pairs)
my_hash = {"name" => "App Academy", "color" => "red", "age" => 5, "isAwesome" => true}

puts my_hash
puts my_hash["name"]
my_hash["color"] = "pink" #更改value 用单= 
my_hash["age"] += 1
puts my_hash

my_hash = {
    "name" => "App Academy",
    "color" => "red", 
    "age" => 5, 
    "isAwesome" => true,
    42 => "hello"
}
puts my_hash[42]
puts
## hash methods
# a key is unique in the hash
dog = {"name" => "Fido", "color" => "black", "age" => 3, "isHugry" => true, "enemies" => ["squirrel"]}

puts dog
 #几个pairs
puts dog.length
#更改vaule的值
dog["name"] = "Roro" 
#增加一个pair，如果表中没有这个key
dog["location"] = "WA" 
# 加减value的数值
dog["age"] += 10 

#hash里面有array，照样可以做array的操作 dog["enemies"] << ["good"]
dog["enemies"] += ["good"] 
puts dog

# 判断是否有这个key在hash里。大小写会区分, 返回Boolean
dog.has_key?("color")
# 判断是否有这个value在hash里。大小写会区分，返回Boolean
puts dog.has_value?(3)

#查询hash里的所有keys
puts "-----"
print dog.keys
puts dog.keys[1] #key index
puts "####"

# 查询values
print dog.values
print dog.values[2] #value index

### why hash
person = ["Alvin", 100, "NY", "burgers", true] #not a good array data
# better as hash
better_person = {
    "name" => "Alvin", 
    "age" => 100, 
    "location" => "NY", 
    "favoriteFood" => "burgers", 
    "isHungry" => true
}

# 创建 value 是 array 的hash：
count = Hash.new { |h, k| h[k] = []}
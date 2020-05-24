## map

#把原有的array里面的elements 进行更改，需要新建一个空的array，然后用each走一遍loop
newArr = []
arr = ["a", "b", "c", "d"]
arr.each { |ele| newArr << ele.upcase + "!"}
print newArr
puts

#同样的例子，用map试一下，不需要新建空的array了，因为map直接生成新的elements
newArr2 = arr.map {|ele| ele.upcase + "!" } 
print newArr2
puts

## 带有判断的例子
nums = [1, 2, 3, 4, 5, 6]
evens = []

nums.each do |ele|
    if ele % 2 == 0
        evens << ele
    end
end
print evens

#同一个例子，用 .select 作为Boolean的判断，然后生成新的array。
nums2 = [1, 2, 3, 4, 5, 6]
evens = nums2.select { |ele| ele % 2 == 0}
print evens

#map & select

arr = ["apple", "bootCamp", "caRrot", "DaNce"]
new_arr = arr.map { |word| word[0].upcase + word[1..-1].downcase}
print new_arr

# do block
arr = ["apple", "bootCamp", "caRrot", "DaNce"]
donew_arr = arr.map do |ele|
    ele[0].upcase + ele[1..-1].downcase  #最后一行最重要，会返回这一行的值
end
print donew_arr


arr = ["apple", "bootCamp", "caRrot", "DaNce"]
donew_arr2 = arr.map.with_index do |ele, idx|
    new_word = ele[0].upcase + ele[1..-1].downcase 
    new_word * idx
end
print donew_arr2
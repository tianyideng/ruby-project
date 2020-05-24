#array []
letters = ["a", "b", "c"]

print letters[1]

new_arr = [
    "array", 
    true, 
    false, 
    2
] # array 可以不同的数据， 可以分割开 
print new_arr

print "\n" #回车一行，格式好看

#<< 加一个element在结尾
new_arr << "brain" 
print new_arr

#change an element
new_arr = [
    "array", 
    true, 
    false, 
    2
]

new_arr[1] = "Tiffany"
print new_arr


#
foods = ["pizza", "sushi", "burgers", "fries", "ramen"]

i = 0
while  i < foods.length
    puts foods[i]

    i+= 1
    
end


def print_array(arr)
    i = 0
    while  i < foods.length
        puts foods[i]
    
        i+= 1
        
    end
end    

print_array(foods)
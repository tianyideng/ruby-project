# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    prime = []
    (2..num).each do |divisor|
        prime << divisor if num % divisor == 0 && is_prime?(divisor)

    end
    prime.max
end

def is_prime?(n)
    (2...n).each do |factor|
        if n % factor == 0 
            return false
        end
    end
    return true
end

def unique_chars?(str)
    count = Hash.new(0)

    str.each_char do |char|
        count[char] += 1
    end
    count.values.all? { |ele| ele == 1}
end

def dupe_indices(arr)
    count = Hash.new { |h, k| h[k] = []}

    arr.each_with_index do |ele, i|      
        count[ele] << i
    end
    count.delete_if { |key, value| value.length < 2}
end

def ana_array(arr1, arr2)
    count_1 = ele_count(arr1)
    count_2 = ele_count(arr2)
    count_1 == count_2

end

def ele_count(arr)
   count = Hash.new(0) 
   arr.each { |ele| count[ele] += 1 }

   count
end
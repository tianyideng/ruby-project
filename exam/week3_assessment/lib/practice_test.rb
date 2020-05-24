# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  return false if string.length < key.length
  key.each_char do |ele|
    return true if string.include?(ele)
  end

  
end

# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
  return 1 if n == 1 || n == 2
  sum = 0
  sum += (fibs_sum(n - 1) + fibs_sum(n - 2))
  
  
end


# Write a method that returns the factors of a number in ascending order.

def factors(num)
  return nil if num < 0
  return 1 if num == 1
  (1..num).select { |n| num % n == 0}


end

class String
  # Define a method `String#symmetric_substrings` that returns an array of 
  # substrings that are palindromes.  Only include substrings of length > 1.

  # example: "cool".symmetric_substrings => ["oo"]

  def symmetric_substrings


  end
end

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)


  end
end

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)

  end
end

class Array
  # Define a method `Array#quick_sort` that implements the quick sort method. 
  # The method should be able to accept a block. **Do NOT use the built-in
  # `Array#sort` or `Array#sort_by` methods in your implementation.**

  def my_quick_sort(&prc)
    return self if self.length <= 1 
    pivot_arr = [self[0]]
    res = []
    my_quick_sort({ |el| res.unshift(el) if el < self[0] }) + pivot_arr + my_quick_sort({ |el| res << el if el >= self[0] })
  end  

  
end


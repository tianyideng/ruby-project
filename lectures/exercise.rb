# 金字塔求和
# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6
def sum(new)
    arr = []
    new.each_with_index do |n, i|
      if i < new.length - 1
        sum = n + new[i + 1]
        arr << sum
      end
    end
    return arr
  end
  
def pyramid_sum(base)
  final_arr = [base]
  while final_arr.length < base.length
    prev_level = final_arr[0]
    final_arr.unshift(sum(prev_level))
    
  end
  return final_arr
end
  
  print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
  puts
  
  print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
  puts "##########"

  #### Same Char Collapse #### (一般用stack去做，但这里没讲过，所以先用array来做）

# ##求质因数###prime factor
  def prime_factors(num)
    arr = []
    (1..num).each do |divisor|
      if num % divisor == 0 && prime(divisor)
        arr << divisor
        
      end
    end
    return arr
  end
  
  
  def prime(divisor)
    if divisor < 2
      return false
    end
    
    (2...divisor).each do |divisor2|
      if divisor % divisor2 == 0
        return false
        
      end
    end
    
    return true
  end
  
  print prime_factors(24) #=> [2, 3]
  puts
  print prime_factors(60) #=> [2, 3, 5]
  puts

  #### Transpose ####
def my_transpose
  new_arr = []

  (0...self.length).each do |row|
      new_subarray = []

      (0...self[0].length).each do |col|
          new_subarray << self[col][row]
      end

      new_arr << new_subarray
  end


  new_arr
end
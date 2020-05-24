# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
# def coprime?(num_1, num_2)
#     (2..num_1).each do |divisor|
#         #if num1 and num2 divisor both, return false
#         #说明除了1以外还有其他公约数，那就返回false了
#         if num_1 % divisor == 0 && num_2 % divisor == 0
#             return false
#         end
#     end
#     true
# end

#也可以这么写, non?直接返回Boolean，然后放在一行表示。
def coprime?(num_1, num_2)
    (2..num_1).none? { |divisor| num_1 % divisor == 0 && num_2 % divisor == 0}

end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

def prime?(num)
    if num < 2
        return false
    else
        (2...num).each do |ele| 
            return false if num % ele == 0
        end
    end
    true
end
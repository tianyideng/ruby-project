require "byebug"

def my_map(arr, &prc)
    res = []
    arr.each { |ele| res << prc.call(ele) }

    res
end

def my_select(arr, &prc)
    res = []
    arr.each do|ele| 
        if prc.call(ele)
            res << ele
        end
    end
    res
end

def my_count(arr, &prc)
    res = 0

    arr.each do |ele|
        if prc.call(ele)
            res +=1
        end
    end
    res
end

def my_any?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return true
        end
    end

    false
end

def my_all?(arr, &prc)
    arr.each do |ele|
        if !prc.call(ele)
            return false
        end
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    true
end
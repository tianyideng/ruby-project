# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    require "byebug"

    def span
        if self == []
            return nil
        else 
            self.max - self.min
        end
    end

    def average
        if self == []
            return nil
        else  
            sum = self.inject { |acc, ele| acc + ele}
            return average = sum / (self.length * 1.0)
        end
    end

    def median
        sorted = self.sort
        if self == []
            return nil
        else 
            if self.length % 2 != 0
                middle = self.length / 2 
                return sorted[middle]
            else 
                middle_first = self.length / 2
                middle_second = middle_first - 1
                return (sorted[middle_first] + sorted[middle_second]) / 2.0
            end
        end
    end

    def counts
        count = Hash.new(0)

        self.each { |ele| count[ele] += 1 }

        return count
    end

    def my_count(val)
        self.counts[val]
    end

    def my_index(val)
        if self.include?(val)
            self.each_with_index do |ele, i|
                if ele == val
                    return i
                end
            end  
        else  
            return nil
        end   
    end

    def my_uniq
        counts.keys
    end

    # def my_transpose
    #     counter = []
    #     (0...self.length).each_with_index do |subarray, firstidx, secondidx|
    #         self[firstidx][(0...secondidx.length)]
    #         (0...secondidx).each do |ele|
    #             self[ele][]
    #             counter << subarray
    #             firstidx +=1
    #         # (0...subarray.length).each_with_index do |ele, secondidx|


    #         # end 
    #     end
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

end

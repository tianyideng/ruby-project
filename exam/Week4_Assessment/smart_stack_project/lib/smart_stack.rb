class SmartStack < Stack
    # protected :max_size
    # private :underlying_array

    def initialize(num)
        @max_size = num
        @underlying_array = Array.new()
    end

    def max_size
        @max_size
    end

    def full?
        if self.size == self.max_size
            return true
        else 
            return false
        end
    end

    def push(item)
        
        if item.size + @underlying_array.size >= self.max_size
            raise "stack is full"
        end
        @underlying_array.push(item)
       
	end

    def pop()
        return nil if self.size == 0
		temp_value = @underlying_array.pop
	end


end

class Stack

    def initialize()
      
         @underlying_array = Array.new()
	end

    def size()
        @underlying_array.length
    end

    def empty?
        if self.size == 0
            return true 
        else
            return false
        end
    end

    def top()
		@underlying_array[-1]
    end
    
    def peek(n)
        temp_array = []
        count = 1
        while count <= n
            ele = @underlying_array[-count]
            temp_array << ele
            count += 1
        end

        temp_array

    end

	def push(item)
        @underlying_array.push(item)
        self.size
	end

    def pop()
        return nil if self.size == 0
		temp_value = @underlying_array.pop
	end


end


class Board
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    require "byebug"

    def self.build_stacks(num)
        @stack = Array.new(num) { Array.new(0) }
    end

    def initialize(num, height)
        if num < 4 || height < 4
            return raise "rows and cols must be >= 4'"
        end

        @max_height = height
        @stacks = Board.build_stacks(num)
        @number = num
    
        
    end

    def max_height
        @max_height
    end

    def add(token, idx)
        if @stacks[idx].length < @max_height
            @stacks[idx] << token
            return true
        else 
            return false
        end
    end

    def vertical_winner?(token)
        
        # @stacks.any? { |stack| stack.all?(token)} &&  @stacks.any? { |stack| stack.length = @stacks.length }
        @stacks.any? { |stack| stack.all?(token) && stack.length == @max_height} 
    end

    def horizontal_winner?(token)
       

        # (0...@max_height).each do |height|
        #     count = 0

        #     (0...@number).each do |num|
        #         if height < @stacks[num].length
        #             if @stacks[num][height] == token
        #                 count += 1
        #             end
        #         else 
        #             break
        #         end
        #     end
        

        #     if count == @number
        #         return true
        #     end
        # end

        # return false
        debugger 

        transpose = @stacks.zip([]).transpose
        transpose.any? { |row| row.all?(token) }
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)

    end




    def print
        @stacks.each { |stack| p stack }
    end
    
end

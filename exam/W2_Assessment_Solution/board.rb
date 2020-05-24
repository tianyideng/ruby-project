class Board
    attr_reader :max_height
    def initialize(number_of_stacks, max_height)
        raise 'rows and cols must be >= 4' if number_of_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(number_of_stacks)
    end

    def self.build_stacks(number_of_stacks)
        return Array.new(number_of_stacks) {[]}
    end

    def add(token, stack_index)
        stack = @stacks[stack_index]
        if stack.length < @max_height
            @stacks[stack_index] << token
            true
        else
            false
        end
    end

    def vertical_winner?(token)
        @stacks.any? do |stack|
            stack.length == @max_height && stack.all? {|ele| ele == token}
        end
    end

    def horizontal_winner?(token)
        (0...max_height).any? do |c|
            (0...@stacks.length).all? {|r| @stacks[r][c] == token}
        end
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end

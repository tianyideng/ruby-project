class Board
    
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
    end

    def size
        @size
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                if @grid[row][col] == :S 
                    count += 1
                end
            end
        end

        count

        #@grid.flatten.count { |ele| ele == :S } #合成一个array去查询 很方便
    end

    def attack(pos)
        if self[pos] == :S 
            self.[]=(pos, :H)
            puts "you sunk my battleship!"
            return true
        else 
            self.[]=(pos, :X)
            return false
        end
    end

    def place_random_ships
        arr = []
        while self.num_ships < (@size * 0.25) #这里是重点，否则random的有可能重复，导致数量不够25个
            arr << [rand(@grid.length), rand(@grid.length)]
            arr.map do |pos|
                self.[]=(pos, :S)
            end
        end

    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    ele = :N 
                else  
                    ele  
                end
            end
        end

    end

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end

    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
  
end

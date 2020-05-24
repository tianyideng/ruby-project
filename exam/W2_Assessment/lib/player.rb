class Player


    # This Player#get_stack_index method is given for free and does not need to be modified
    # It is used to make your game playable.
    def initialize(token)
        @token = token
    end

    def token
        @token
    end

    def get_stack_index
        p "player " + @token + ", enter a valid stack index"
        gets.chomp.to_i
    end
end
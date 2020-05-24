require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    
    end

    def print_matches(code)
        print @secret_code.num_exact_matches(code)
        print @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        print "Enter a code"
        input = gets.chomp
        code = Code.from_string(input)
        puts self.print_matches(code)
        @secret_code == code
    end

end

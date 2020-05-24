class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  require "byebug"

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.split("").map { |ele| ele = "_"}
    # @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    new_arr = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        new_arr << i
      end
    end

    new_arr
  end

  def fill_indices(char, arr)
    # @guess_word.map.each_with_index do |space, i|
    #   arr.each do |ele| 
    #     i = ele
    #     @guess_word[i] = char
    #   end
    # end
    arr.each do |ele|
      @guess_word[ele] = char
    end
  end

  def try_guess(char)
    
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else  
      if @secret_word.include?(char)
        self.fill_indices(char, self.get_matching_indices(char))
      else  
        @remaining_incorrect_guesses -= 1
      end
      @attempted_chars << char
      return true 
    end

    
  end

  def ask_user_for_guess
    print "Enter a char"
    guess = gets.chomp
    return self.try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    else  
      return false
    end
  end

    def lose?
      if @remaining_incorrect_guesses == 0
        print "LOSE"
        return true
      else 
        return false
      end
    end

    def game_over?
      if self.win? || self.lose?
        print @secret_word
        return true
      else 
        return false
      end
    end

end

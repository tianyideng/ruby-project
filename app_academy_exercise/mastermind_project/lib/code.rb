class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? do |ele|
      POSSIBLE_PEGS.has_key?(ele.upcase)
    end
  end

  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise "error"
    else  
      @pegs = arr.map(&:upcase)
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))

  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    (0...self.length).each do |i|
      if @pegs[i] == code[i]
        count += 1
      end
    end
      count
  end

  def num_near_matches(code)
    count = 0
    
    (0...code.length).each do |i|
      if @pegs[i] != code[i] && @pegs.include?(code[i])
        count += 1
      end
    end
    
    count 
  end

  def ==(another_code)
    @pegs == another_code.pegs
    # self = another_code
  end

end

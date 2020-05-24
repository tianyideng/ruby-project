class Dog
    attr_reader :name, :breed, :age, :favorite_foods

    def initialize(name, breed, age, bark, fav)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = fav
    end

    def age=(num)
        @age = num
    end

    def bark
        if self.age > 3
            return @bark.upcase
        else 
            return @bark.downcase
        end
    end

    def favorite_food?(food)
        down_case = @favorite_foods.map(&:downcase)
        if down_case.include?(food.downcase)
            return true
        else
            return false
        end
    end

end

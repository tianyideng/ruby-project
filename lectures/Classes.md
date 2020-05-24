# Classes
为了更轻松愉快地理解 class 知识，我们举个猫咪的例子。通常我们创建很多猫，可以用hash来建立：
```
cat_1 = {name: "Sennacy", color: "brown", age: 3}
cat_2 = {name: "Whiskers", color: "white", age: 5}
cat_3 = {name: "Garfield", color: "orange", age: 7}
```
但是用hash的方法很容易出错，比如拼写错误等。如果一次建立1000个猫，更加麻烦，有可能建立出重复的猫，两只都叫Lily也有可能。为了达到DRY（dont't repeat yourself），我们可以用Class来建立猫。
首先建立一个猫的种类：
```
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
cat_2 = Cat.new("Whiskers", "white", 5)
p cat_1 #<Cat:0x007fb6d804cfe0 @age=3, @color="brown", @name="Sennacy">
p cat_2 #<Cat:0x007fb6d6bb60b8 @age=5, @color="white", @name="Whiskers">
```
Class 的名字开头要大写，里面的instances变量和属性开头用 @ 。我们建立不同的猫，直接输入value即可~很方便吧！之后可以看每只猫有不同的id，恭喜你，猫咪建立成功了。
## Getter Method
我们可以嵌套进去Getter method，这样调用的时候可以直接获取准确的对应的信息。需要注意，getter method 不可以更改value。
```
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def get_name
    @name
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1.get_name # "Sennacy"
cat_1.name = "Kitty"  # This will give NoMethodError: undefined method `name='
```
## Setter Method
如果想要后续更改信息，可以建立Setter Method。
```
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end

  # setter
  def age=(number)
    @age = number
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1 #<Cat:0x007f8511a6f340 @age=3, @color="brown", @name="Sennacy">
cat_1.age = 42
p cat_1 #<Cat:0x007f8511a6f340 @age=42, @color="brown", @name="Sennacy">
```
## Instance vs Class Variables 统一的variable
当我们想给所有的猫建立一个共同属性的variable，我们可以用Class属性，这里用@@ 开头。
```
class Car
  @@num_wheels = 4

  def initialize(color)
    @color = color
  end

  # getter for @color instance variable
  def color
    @color
  end

  # getter for @@num_wheels class variable
  def num_wheels
    @@num_wheels
  end
end

car_1 = Car.new("red")
p car_1.num_wheels    # 4

car_2 = Car.new("black")
p car_2.num_wheels    # 4
```
这样无论是黑猫还是红猫，都是有四只脚，者和实际情况也一样。需要注意，@@的instances是在def之外的。这个功能是强大的，所有创建的猫都共享这个特点，所以功能强大的同时也有一个缺点，如果更改了，所有个体也都跟着变了，需要使用注意。
## Class Constants 常变量
可以用Constants固定某些不变的值，不可被Reassigned。Constant名字必须要全部大写
```
class Car
  NUM_WHEELS = 4

  def self.upgrade_to_flying_cars
    NUM_WHEELS = 0    # SyntaxError: dynamic constant assignment
  end

  def initialize(color)
    @color = color
  end

  def num_wheels
    NUM_WHEELS
  end
end


car_1 = Car.new("red")
car_2 = Car.new("black")

p car_1.num_wheels    # 4
p car_2.num_wheels    # 4

Car.upgrade_to_flying_cars
```
Constant名字必须要全部大写
## Wrapping Up
1. **@instance_variable** Instances属性
2. **@@class_variable** Class属性，整个Class共享
3. **CLASS_CONSTANT** Class常变量，不可被reassigned

## Instance Methods vs Class Methods
实例Method（instance）主要针对个体的改变。例如我们之前说的instance variable，都是作用在instance method里面。调用的时候用Class#method_name 。调用的时候如果class外面有个重名的，我们以class里面的method为第一。看下面的例子，我们建立了一个method，里面用到了self.method去调用class里面的另一个method。
```
class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def yell_name
    @name.upcase + "!"
  end

  def speak
    self.yell_name + " says " + @bark
  end
end

my_dog = Dog.new("Fido", "woof")
my_dog.speak          # "Fido says woof"

other_dog = Dog.new("Doge", "much bork")
other_dog.speak       # "Doge says much bork"
```
Class Method是针对整个类操作的method,一般method的名字都以 self.开头， self代表这个类的名字（dog）。调用的时候我们用 Dog::growl。我们也可以直接在建立method的时候使用class method：
```
class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def self.growl
    "Grrrrr"
  end
end

Dog.growl   # Grrrrr
```
## Wrapping Up
1. Dog::method is a class method
2. Dog#method is an instance method
3. 如果method里面需要属性，一般是instance method，因为只有实际的instance才会有属性（attribute）。
4. 如果method不依靠attribute或者某些class里面的instance，那我们就可以建立class method。

## Class Monkey Patching
我们先建立一个str，来看看他的upcase是什么
```
str = "hello"
p str.upcase
```
那我想要判断这个str是否是upcase的，ruby没有这个function：upcase？。但我们可以自己建立一个class去实现upcase？这个function，最后返回结果是Boolean。
```
class String
    def upcase?
    self.upcase == self
    end
end

p "hello".upcase? #=> false
```
这种方法没有属性，用self代表参数。一般是在class里面给其他method做基础。

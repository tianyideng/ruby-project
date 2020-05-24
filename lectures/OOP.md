# Abstraction 抽象
把某些要求写在class里面，这样class结束后可以直接调用。

帮助把inner detail隐藏起来，起到安全作用。

Many drivers do not understand the mechanical details of how a steering wheel works, but they can still use the steering wheel to drive a car.
```
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end
###这个enroll就是抽象了，class外面的人不知道这个method怎么写的。
  def enroll(student)
    @students << student if @students.length < @max_students
  end
end  

course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# Let's to enroll a student
course.enroll("Alice")

```

# Encapsulation 封装
safe to use for giving the users access

不写不需要的东西，这样防止意外发生。
```
# this class fails to encapsulate
class Queue
  def initialize
    @line = []
  end

  def line
    @line
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new

grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.line.unshift("noam")   # noam cut the line!
grocery_checkout.remove                 # => "noam"
```
class Bootcamp
    require "byebug"

    attr_reader :name, :slogan, :teachers, :students

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else  
            @student_capacity
            return false
        end
    end

    def enrolled?(student)
        if @students.include?(student)
            return true
        else
            return false
        end
    end 
    
    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade
            return true
        else  
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        all_grades = @grades[student]
        if all_grades == [] || !enrolled?(student)
            return nil
        else 
            total = all_grades.inject { |acc, num| acc + num }
            average = total / all_grades.length
        end
    end

end



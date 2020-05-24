require "employee"

class Startup
    require "byebug"

    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else  
            raise "error"
        end
        @employees
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        sal = @salaries[employee.title]
        if @funding >= @salaries[employee.title]
            employee.pay(sal)
            @funding -= sal
        else  
            raise "error"
        end
        
    end

    def payday
        @employees.each do |ele|
            self.pay_employee(ele)
        end
    end

    def average_salary
        salary = 0
        # @employees.each do |employee|
        #     employee.each_with_char do |ele, i|
        #         if i == 1
        #             salary << @salaries[ele]
        #         end
        #     end
        # end
        @employees.each do |employee|
           salary += @salaries[employee.title]
        end
        
        salary / @employees.length


    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |k, v|
            if !@salaries.include?(k)
                @salaries[k] = v
            end
        end
        @employees += another_startup.employees
        another_startup.close

    end


end

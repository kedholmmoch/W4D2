

class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @boss = boss
    @title = title
    @salary = salary
  end 

  def bonus(multiplier)
    @salary * multiplier
  end
end


class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    sum = 0
    @employees.each { |emp| sum += emp.salary }
    sum * multiplier
  end
end





shawna = Employee.new('Shawna', 'TA' , 12000, nil)
david = Employee.new('David', 'TA' , 10000, nil)
darren = Manager.new('Darren', 'TA Manager' , 78000, nil, [shawna, david])
ned = Manager.new('Ned', 'Founder', 1000000, nil, [darren, shawna, david])
shawna.boss = darren
david.boss = darren
darren.boss = ned

 p ned.bonus(5)

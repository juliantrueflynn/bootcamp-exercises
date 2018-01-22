class Employee
	attr_reader :name, :title, :salary, :boss

	def initialize(name, title, salary, boss = nil)
		@name = name
		@title = title
		@salary = salary
		@boss = boss
	end

	def bonus(multiplier)
		salary * multiplier
	end
end

class Manager < Employee
	attr_reader :employees

	def initialize(name, title, salary, boss = nil, employees)
		@employees = employees
		super(name, title, salary, boss)
	end
end

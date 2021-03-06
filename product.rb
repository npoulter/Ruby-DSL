# A product is a named collection of jobs
class Product
	attr_reader :name, :jobs

	def initialize(name)
		@name = name.rstrip
		@jobs = []
	end

	def <<(job)
		@jobs << job
	end

end

# A job is a unique object with a type (to be called as a method)
# & an optional text that pertains to the type
class Job
	attr_reader :type, :text
	
	def initialize(type, text)
		@type = type.rstrip
		@text = text
	end

end
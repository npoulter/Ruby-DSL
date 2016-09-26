=begin
	Names
	: Nicholas Poulter
	: Jess Boerner
	Class: CSCI 400
	Project: Ruby DSL Main file
=end

require 'pp'
require './product.rb'

class RubyDSL
	
	def initializeDSL
		@fileHash = Hash.new
		@products = []
	end
	
	def getUserResponse
		selection = false
		userSelection = 0
		while selection == false
			puts "Your option: "
			# Only take the first character
			userSelection = gets.chomp.chars.first
			# Check that its one of the designated values
			if 1 <= userSelection.to_i && userSelection.to_i <= 3
				selection = true
			else
				puts "You must select a valid option"
			end
		end
		# Case statement to process the input
		case userSelection.to_i
		when 1
			self.getFileName
		when 2
			self.processOrders
		when 3
			self.quitProgram
		end
	end
	
	def printMainMenu
		# Print the menu
		puts "<<<<<  Main Menu >>>>>"
		puts "1. Load rules"
		puts "2. Process Orders"
		puts "3. End"
		
		self.getUserResponse
	end
	
	def getFileName
		puts "Enter file name containing the rules: "
		fileName = gets.chomp
		self.loadFile(fileName)
	end
	
	def loadFile(fileName)
		# Check that the file name has the .txt extension, add if needed
		if fileName =~ /\.txt/
			fileName = fileName
		else
			fileName = fileName + ".txt"
		end
		
		# Open the file and iterate through it unless it is invalid
		if File.file?(fileName)
			@RuleFile = File.open(fileName.to_s)
			theJob, theText, lastLine = nil
			# Iterate line by line
			while line = @RuleFile.gets
				# Split the line into job & text
				theJob, theText = line.split("'")
				if((lastLine == nil || (lastLine =~ /^\n/)) && !(line =~ /^\n/))
					@products << Product.new(theText)
				elsif( !(line =~ /^\n/) )
					@products.last << Job.new(theJob, theText)
				end
				
				lastLine = line
			end
		else
			puts "Invalid filename! Please try again."
		end
		
		# uncomment to pretty print the products after they have loaded
		# pp @products
		
		self.printMainMenu
	end
	
	def processOrders
		keepProcessing = true
		# Continue processing the orders until the user enters 'd' or 'D'
		while keepProcessing == true
			puts "Enter product type or 'D' (Done) to end:"
			theType = gets.chomp
	
			if theType == 'd' || theType == 'D'
				keepProcessing = false
				self.printMainMenu
			end
			# start the process for this product
			product(theType)
		end
	end
	
	# Exit if the user enters 3 at the main menu
	def quitProgram
		puts "Thanks for using the DSL."
		exit
	end
	
end

# Define the methods for processing the orders
def product(text)
	# ensure the product is valid (iterate through products, matching against name)
	
	# if valid, do the jobs for the product (turn each job into symbol & call with params)
end

def packing_slip(text)
	puts "---- Creating a packing slip for the #{text} department"
end

def pay(text)
	puts "---- Paying #{text}"
end

def email(text)
	puts "---- Emailing the #{text}"
end

def activate
	puts "---- Activating the membership"
end

def free(text)
	puts "---- Including a #{text}"
end

def fill(text)
	puts "---- Printing a #{text} for the customer to fill out"
end

# For testing that things are working properly
DSL = RubyDSL.new
DSL.initializeDSL
DSL.printMainMenu

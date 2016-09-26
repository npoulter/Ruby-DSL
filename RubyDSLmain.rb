=begin
	Names
	: Nicholas Poulter
	: Jess Boerner
	Class: CSCI 400
	Project: Ruby DSL Main file
=end

class RubyDSL
	
	def initializeDSL
		@fileHash = Hash.new
	end
	
	def printMainMenu
		selection = false
		userSelection = 0
		# Print the menu
		puts "<<<<<  Main Menu >>>>>"
		puts "1. Load rules"
		puts "2. Process Orders"
		puts "3. End"
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
			x = 0
			theCommand = ""
			theProduct = ""
			# Iterate line by line
			while line = @RuleFile.gets
				# Split the line into words
				line.split(' ').each do |word|
					if x % 2 == 0
						# First word is the product
						puts word
						theProduct = word
						x = x + 1
					else
						# Second word is what we're doing with it
						theCommand = word
						# Store it in the hash
						@fileHash[theProduct.to_sym] = theCommand.to_sym
						x = x + 1
					end
				end
			end
		else
			puts "Invalid filename! Please try again."
		end
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

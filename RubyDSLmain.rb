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
		puts "<<<<<  Main Menu >>>>>"
		puts "1. Load rules"
		puts "2. Process Orders"
		puts "3. End"
		puts "Your option: "
		# Only take the first character
		userSelection = gets.chomp.chars.first
	end
	
	def getFileName
		puts "Enter file name containing the rules: "
		fileName = gets.chomp
	end
	
	def loadFile(fileName)
		# Check that the file name has the .txt extension
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
end

DSL = RubyDSL.new
DSL.initializeDSL
DSL.printMainMenu
DSL.loadFile(DSL.getFileName)

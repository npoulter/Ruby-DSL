=begin
	Names
	: Nicholas Poulter
	: Jess Boerner
	Class: CSCI 400
	Project: Ruby DSL Main file
=end

class RubyDSL
	
	def printMainMenu
		puts "<<<<<  Main Menu >>>>>"
		puts "1. Load rules"
		puts "2. Process Orders"
		puts "3. End"
		puts "Your option: "
		userSelection = gets.chomp.chars.first
	end
	
	def getFileName
		puts "Enter file name containing the rules: "
		fileName = gets.chomp
	end
	
	def loadFile(fileName)
		if fileName =~ /\.txt/
			fileName = fileName
		else
			fileName = fileName + ".txt"
		end
		if File.file?(fileName)
			@RuleFile = File.open(fileName.to_s)
		else
			puts "Invalid filename! Please try again."
		end
	end
end

DSL = RubyDSL.new
DSL.printMainMenu
DSL.loadFile(DSL.getFileName)

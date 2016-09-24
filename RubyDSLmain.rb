=begin
	Names
	: Nicholas Poulter
	: Jess Boerner
	Class: CSCI 400
	Project: Ruby DSL Main file
=end

class JustDoIt
	def printMainMenu
		puts "<<<<<  Main Menu >>>>>"
		puts "1. Load rules"
		puts "2. Process Orders"
		puts "3. End"
	end
end

doIt = JustDoIt.new
doIt.printMainMenu
pages_with_questions = {}

lines_grabbed = ""
key = ""

File.open("story.txt", "r") do |infile|
  while (line = infile.gets)
    if line.index("~p")
    	key = line
    	lines_grabbed = ""
    else
     	lines_grabbed += line
    end
      pages_with_questions[key] = lines_grabbed
  end
end

#start while loop to restart the game
restart = 1
while restart == 1

# puts pages_with_questions

p1 = pages_with_questions.select do |key, value|
	key.index("~p1")
end

p1.each do |k, v|
	puts v
end

# next needs user input to determine what index gets brought up next (is is p2, p3, or p4?)
puts "please answer with 1, 2, or 3."

possibilites = [1,2,3] # an array of the only possibile responses

users_choice = gets.to_i
until possibilites.include? "#{users_choice}".to_i  

puts "please ONLY answer with 1, 2, or 3."
users_choice = gets.to_i

end

cx = users_choice + 1
	choice = pages_with_questions.select do |key, value|  
		key.index("~p#{cx}")  #I used the cx variable to decide which ~p to look for
	end

	choice.each do |k, v|
		puts v
	end

# Here's the option to try again. I know it's not quite right if they pick anything else though...
	puts "Your choice is set in stone. Hope you chose well...MUAHAHAHAHAHA!!! Just kidding! Want to try again?"
	puts "Type 1 for yes"
	puts "Type 2 for no"
	restart = gets.to_i
	if restart != 1 
		puts "Clearly you're no fun. Goodbye."
	end
end

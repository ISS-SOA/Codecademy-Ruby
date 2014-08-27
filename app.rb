require './badges.rb'

puts "Please type the username: "	# Prompt user to type username
username = gets.chomp

badges_found = CodecademyBadges.get_badges('soumya.ray')

puts "#{username} has collected #{badges_found.size} badges."

badges_found.each do |title, date|
  puts "Badges '#{title}' on #{date}."
end

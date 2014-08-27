require './badges.rb'

fail ArgumentError, "Usage:  badges [username]\n" if ARGV.count == 0
user_name = ARGV[0]

badges_found = CodecademyBadges.get_badges(user_name)

puts "#{user_name} has collected #{badges_found.size} badges."

badges_found.each do |title, date|
  puts "Earned '#{title}' on #{date}."
end

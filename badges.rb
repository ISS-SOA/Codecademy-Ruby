require 'nokogiri'				# Import necessary packages
require 'open-uri'

user_information = Hash.new(0)	# user_information is a hash to store 'title' and 'date' of badges
count = 0						# Initial the loop counter

puts "Please type the username: "	# Prompt user to type username
username = gets.chomp

url = "http://www.codecademy.com/users/#{username}/achievements"
doc = Nokogiri::HTML(open(url))		# Get the HTML source from the url

titles = doc.xpath("//div[@class = 'grid-row']//h5[@class = 'margin-top--1']") 	# Store badges' titles as an array
dates = doc.xpath("//small[@class = 'text--ellipsis']")							# Store badges' date

while count < titles.length do
	user_information[titles[count].text.to_sym] = dates[count].text
	count += 1
end

puts "#{username} has collected #{titles.length} badges."
user_information.each do |title, date|
	puts "Badges '#{title}' on #{date}."
end
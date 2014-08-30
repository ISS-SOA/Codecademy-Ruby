require 'nokogiri'
require 'open-uri'
require 'date'

module CodeBadges
	class CodecademyBadges
		def self.get_badges(username)
			doc = getHTML(username)
			titles = getTitles(doc)
			dates = getDates(doc)
			user_information = integrate(titles, dates)
		end

		def self.getHTML(username)
			url = "http://www.codecademy.com/users/#{username}/achievements"
			document = Nokogiri::HTML(open(url))
		end

		def self.getTitles(document)
			document.xpath("//div[@class = 'grid-row']//h5[@class = 'margin-top--1']")
		end

		def self.getDates(document)
			document.xpath("//small[@class = 'text--ellipsis']")
		end

		def self.integrate(titles, dates)
			badges = Hash.new(0)
			count = 0
			while count < titles.length do
				badges[titles[count].text] = Date.parse(dates[count].text)
				count += 1
			end
			badges
		end
	end
end

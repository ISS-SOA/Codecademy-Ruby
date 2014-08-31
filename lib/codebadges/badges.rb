# Author:   Lee Chen (mailto: chung1350@hotmail.com)
# License:  MIT
module CodeBadges
  # This class get the user account as an input
  # return a hash of user's badges information
  class CodecademyBadges
    def self.get_badges(username)
      doc = get_html(username)
      titles = get_titles(doc)
      dates = get_dates(doc)
      user_information = integrate(titles, dates)
      user_information
    end

    def self.get_html(username)
      url = "http://www.codecademy.com/users/#{username}/achievements"
      document = Nokogiri::HTML(open(url))
      document
    end

    def self.get_titles(document)
      document.xpath("//div[@class = 'grid-row']//h5[@class = 'margin-top--1']")
    end

    def self.get_dates(document)
      document.xpath("//small[@class = 'text--ellipsis']")
    end

    def self.integrate(titles, dates)
      badges = Hash.new(0)
      titles.each_with_index do |value, index|
        badges[value.text] = Date.parse(dates[index].text)
      end
      badges
    end
  end
end

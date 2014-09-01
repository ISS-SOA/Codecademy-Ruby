require 'nokogiri'
require 'open-uri'
require 'date'
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
      integrate(titles, dates)
    end

    def self.get_html(username)
      url = "http://www.codecademy.com/users/#{username}/achievements"
      Nokogiri::HTML(open(url))
    end

    def self.get_titles(document)
      document.xpath("//div[@class = 'grid-row']//h5[@class = 'margin-top--1']")
    end

    def self.get_dates(document)
      document.xpath("//small[@class = 'text--ellipsis']")
    end

    def self.integrate(titles, dates)
      badge_array = titles.each_with_index.map do |_, index|
        [titles[index].text, Date.parse(dates[index].text)]
      end
      Hash[badge_array]
    end
  end
end

require 'nokogiri'
require 'open-uri'
require 'date'
# Author:   Lee Chen (mailto: chung1350@hotmail.com)
# License:  MIT
module CodeBadges
  # This class get the user account as an input
  # return a hash of user's badges information
  class CodecademyBadges
    TITLE_XPATH = "//div[@class = 'grid-row']//h5[@class = 'margin-top--1']"
    DATE_XPATH  = "//small[@class = 'text--ellipsis']"
    USERS_URL = 'http://www.codecademy.com/users'
    ACHIEVEMENTS_DIR = 'achievements'

    def self.get_badges_from_file(file)
      badges_info = read_file(file)
      badges_info.each do |user, badges|
        puts "#{user} has #{badges.size} badges"
        badges.each do |title, date|
          puts "Earned '#{title}' on #{date}."
        end
        puts "\n"
      end
    end

    def self.read_file(file)
      f = File.open(file, 'r')
      users_array = []
      f.each_line.map do |line|
        next if line.chomp.empty?
        users_array.push(line.gsub("\n", ''))
      end
      f.close
      users_badges = users_array.each_with_index.map do |user, _|
        [user, get_badges(user)]
      end
      Hash[users_badges]
    end

    def self.get_badges(username)
      doc = get_html(username)
      titles = get_titles(doc)
      dates = get_dates(doc)
      integrate(titles, dates)
    end

    def self.get_html(username)
      url = "#{USERS_URL}/#{username}/#{ACHIEVEMENTS_DIR}"
      Nokogiri::HTML(open(url))
    end

    def self.get_titles(document)
      titles = document.xpath(TITLE_XPATH)
      titles.map { |t| t.text }
    end

    def self.get_dates(document)
      dates = document.xpath(DATE_XPATH)
      dates.map { |d| Date.parse(d) }
    end

    def self.integrate(titles, dates)
      badge_array = titles.each_with_index.map do |_, index|
        [titles[index], dates[index]]
      end
      Hash[badge_array]
    end
  end
end

CodeBadges::CodecademyBadges.get_badges_from_file('../../spec/test.txt')

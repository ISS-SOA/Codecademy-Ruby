require 'oga'
require 'watir-webdriver'
require 'headless'
require 'open-uri'
require 'date'

module CodeBadges
  ## Changeable Cademy scraper
  class CademySite
    USERS_URL = 'https://www.codecademy.com/users'.freeze
    ACHIEVEMENTS_DIR = 'achievements'.freeze
    LOGIN_URL = 'https://www.codecademy.com/login'.freeze
    USERNAME_TEXTFIELD_ID = 'user_login'.freeze
    PASSWORD_TEXTFIELD_ID = 'user_password'.freeze
    LOGIN_BUTTON_ID = 'user_submit'.freeze

    ACHIEVEMENT_XPATH = "//div[contains(@class,'achievement-card')]".freeze
    ACH_TITLE_XPATH = 'h5'.freeze
    ACH_DATE_XPATH = 'small/small'.freeze

    attr_accessor :html

    def initialize
      @headless ||= Headless.new
      @browser ||= Watir::Browser.new(:firefox)
      return unless block_given?

      yield self
      close
    end

    def self.cadet_achievements_url(cadet)
      "#{USERS_URL}/#{cadet}/#{ACHIEVEMENTS_DIR}"
    end

    def goto(url)
      @browser.goto(url)
    end

    def close
      @browser.close
      @headless.destroy
    end

    def login(username, password)
      @browser.text_field(id: USERNAME_TEXTFIELD_ID).set(username)
      @browser.text_field(id: PASSWORD_TEXTFIELD_ID).set(password)
      @browser.button(id: LOGIN_BUTTON_ID).click
    end

    def extract_achievements
      document = Oga.parse_html(@browser.html)
      document.xpath(ACHIEVEMENT_XPATH).map do |achievement|
        title = achievement.xpath(ACH_TITLE_XPATH).text
        date = Date.parse(achievement.xpath(ACH_DATE_XPATH).text)
        [title, date]
      end.to_h
    end
  end

  # Service object class that takes credentials and username as an input
  # returns a hash of user's badges information
  class GetCodecademyBadges
    def initialize(username, password)
      @username = username
      @password = password
    end

    def call(cadet)
      CademySite.new do |site|
        site.goto CademySite::LOGIN_URL
        site.login(@username, @password)
        site.goto CademySite.cadet_achievements_url(cadet)
        @badges = site.extract_achievements
      end

      @badges
    end
  end
end

require 'oga'
require 'watir-webdriver'
require 'headless'
require 'open-uri'
require 'date'

module CodeBadges
  # This class get the user account as an input
  # return a hash of user's badges information
  class GetCodecademyBadges
    USERS_URL = 'https://www.codecademy.com/users'.freeze
    ACHIEVEMENTS_DIR = 'achievements'.freeze
    ACHIEVEMENT_XPATH = "//div[contains(@class,'achievement-card')]".freeze
    ACH_TITLE_XPATH = 'h5'.freeze
    ACH_DATE_XPATH = 'small/small'.freeze

    def initialize(username, password)
      @username = username
      @password = password
    end

    def call(cadet)
      open_browser
      @browser.goto('https://www.codecademy.com/login')

      enter_credentials
      @browser.button(id: 'user_submit').click
      @browser.goto cadet_achievements_url(cadet)

      extract_achievements.tap { close_browser }
    end

    private

    def open_browser
      @headless ||= Headless.new
      @browser ||= Watir::Browser.new(:firefox)
    end

    def close_browser
      @browser.close
      @headless.destroy
    end

    def cadet_achievements_url(cadet)
      "#{USERS_URL}/#{cadet}/#{ACHIEVEMENTS_DIR}"
    end

    def enter_credentials
      @browser.text_field(id: 'user_login').set(@username)
      @browser.text_field(id: 'user_password').set(@password)
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
end

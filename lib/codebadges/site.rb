require 'oga'
require 'watir-webdriver'
require 'headless'
require 'date'

module CodeBadges
  ## CodeCademy web automation and scraper
  class CademySite
    MAIN_URL = 'https://www.codecademy.com'.freeze
    USERS_URL = "#{MAIN_URL}/users".freeze
    ACHIEVEMENTS_DIR = 'achievements'.freeze

    LOGIN_URL = "#{MAIN_URL}/login".freeze
    USERNAME_TEXTFIELD_ID = 'user_login'.freeze
    PASSWORD_TEXTFIELD_ID = 'user_password'.freeze
    LOGIN_BUTTON_ID = 'user_submit'.freeze

    ACHIEVEMENT_XPATH = "//div[contains(@class,'achievement-card')]".freeze
    ACH_TITLE_XPATH = 'h5'.freeze
    ACH_DATE_XPATH = 'small/small'.freeze

    COURSES_XPATH = "//div[h5/strong/text()='Learn To Code']/div/div/ul/li/a".freeze

    def initialize
      return unless block_given?

      open_browser
      yield self
      close_browser
    end

    def self.cadet_achievements_url(cadet)
      "#{USERS_URL}/#{cadet}/#{ACHIEVEMENTS_DIR}"
    end

    def goto(url)
      @browser.goto(url)
    end

    def open_browser
      @headless ||= Headless.new
      @browser ||= Watir::Browser.new(:firefox)
    end

    def close_browser
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

    def extract_main_courses
      doc = Oga.parse_html(@browser.html)
      doc.xpath(COURSES_XPATH).map do |course|
        [course.text, URI.join(MAIN_URL, course.get('href'))]
      end.to_h
    end
  end
end

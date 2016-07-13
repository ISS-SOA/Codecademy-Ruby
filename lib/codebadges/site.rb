require 'mechanize'
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
      @browser = Mechanize.new do |agent|
        agent.user_agent_alias = 'Linux Firefox'
      end

      yield self if block_given?
    end

    def self.cadet_achievements_url(cadet)
      "#{USERS_URL}/#{cadet}/#{ACHIEVEMENTS_DIR}"
    end

    def goto(url)
      @browser.get(url)
    end

    def login(username, password)
      @browser.page.form do |form|
        form.field(id: USERNAME_TEXTFIELD_ID).value = username
        form.field(id: PASSWORD_TEXTFIELD_ID).value = password
        form.submit
      end
    end

    def extract_achievements
      @browser.page.xpath(ACHIEVEMENT_XPATH).map do |achievement|
        title = achievement.xpath(ACH_TITLE_XPATH).text
        date = Date.parse(achievement.xpath(ACH_DATE_XPATH).text)
        [title, date]
      end.to_h
    end

    def extract_main_courses
      @browser.page.xpath(COURSES_XPATH).map do |course|
        [course.text, URI.join(MAIN_URL, course.attribute('href').value)]
      end.to_h
    end
  end
end

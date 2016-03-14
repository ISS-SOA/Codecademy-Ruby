require 'oga'
require 'headless'
require 'watir-webdriver'
require 'open-uri'
require 'date'

module CodeBadges
  # This class get the user account as an input
  # return a hash of user's badges information
  class CodecademyBadges
    USERS_URL = 'https://www.codecademy.com/users'
    ACHIEVEMENTS_DIR = 'achievements'
    ACHIEVEMENT_XPATH = "//div[contains(@class,'achievement-card')]"
    ACH_TITLE_XPATH = 'h5'
    ACH_DATE_XPATH = 'small/small'

    def initialize(username, password)
      @username = username
      @password = password
    end

    def badges_found
      @badges ||= extract_achievements
    end

    # TODO: accept list of cadets, and yield after scraping each one
    def get_cadet_badges(cadet)
      headless = Headless.new
      browser = Watir::Browser.new
      browser.goto('https://www.codecademy.com/login')

      browser.text_field(id: 'user_login').set(@username)
      browser.text_field(id: 'user_password').set(@password)
      browser.button(id: 'user_submit').click
      url = "#{USERS_URL}/#{cadet}/#{ACHIEVEMENTS_DIR}"
      browser.goto(url)

      @document = Oga.parse_html(browser.html)
      browser.close
      headless.destroy

      badges_found
    end

    private

    def extract_achievements
      @document.xpath(ACHIEVEMENT_XPATH).map do |achievement|
        title = achievement.xpath(ACH_TITLE_XPATH).text
        date = Date.parse(achievement.xpath(ACH_DATE_XPATH).text)
        [title, date]
      end.to_h
    end
  end
end

require 'oga'
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

    def initialize(username)
      parse_html(username)
    end

    def badges
      @badges ||= extract_achievements
    end

    private

    def parse_html(username)
      url = "#{USERS_URL}/#{username}/#{ACHIEVEMENTS_DIR}"
      @document = Oga.parse_html(open(url))
    end

    def extract_achievements
      @document.xpath(ACHIEVEMENT_XPATH).map do |achievement|
        title = achievement.xpath(ACH_TITLE_XPATH).text
        date = Date.parse(achievement.xpath(ACH_DATE_XPATH).text)
        [title, date]
      end.to_h
    end
  end
end

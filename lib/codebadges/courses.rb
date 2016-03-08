require 'oga'
require 'open-uri'
require 'date'

module CodeBadges
  # This class get the user account as an input
  # return a hash of user's badges information
  class CodecademyCourses
    MAIN_URL = 'https://www.codecademy.com'.freeze
    XPATH_COURSES = "//div[h5/strong/text()='Learn To Code']/div/div/ul/li/a".freeze

    def courses
      @courses ||= extract_main_courses
    end

    private

    def extract_main_courses
      doc = Oga.parse_html(open(MAIN_URL))
      doc.xpath(XPATH_COURSES).map do |course|
        [course.text, URI.join(MAIN_URL, course.get('href'))]
      end.to_h
    end
  end
end

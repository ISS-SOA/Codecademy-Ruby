require_relative 'site'

module CodeBadges
  # Service object class that takes credentials and username
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

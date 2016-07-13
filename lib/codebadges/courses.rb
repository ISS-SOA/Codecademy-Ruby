require_relative 'site'

module CodeBadges
  # Service object class that returns all courses
  class GetCodecademyCourses
    def self.call
      CademySite.new do |site|
        site.goto CademySite::MAIN_URL
        @courses = site.extract_main_courses
      end

      @courses
    end
  end
end

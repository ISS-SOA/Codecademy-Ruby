#require 'badges.rb'

# Author:   Lee Chen (mailto: chung1350@hotmail.com)
# License:  MIT
module CodeBadges
  # This class handles multiple users information from codecademy
  class Academy
    def self.get_cadets(usernames)
      users_array = usernames.map { |user| CodecademyBadges.get_badges(user) }
      { cadets: users_array }
    end
  end
end

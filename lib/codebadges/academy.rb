#require 'badges.rb'

# Author:   Lee Chen (mailto: chung1350@hotmail.com)
# License:  MIT
module CodeBadges
  # This class handles multiple users information from codecademy
  class Academy
    def self.get_cadets(users_array)
      users = users_array.map { |user| [user, CodecademyBadges.get_badges(user)] }
      Hash[users]
    end
  end
end

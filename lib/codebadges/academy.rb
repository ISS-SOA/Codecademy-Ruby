#require 'badges.rb'

# Author:   Lee Chen (mailto: chung1350@hotmail.com)
# License:  MIT
module CodeBadges
  # This class handles multiple users information from codecademy
  class Academy
    def self.get_cadets(usernames_array)
      users_array = usernames_array.map { |user| CodecademyBadges.get_badges(user) }
      users_array.reduce Hash.new, :merge
    end
  end
end

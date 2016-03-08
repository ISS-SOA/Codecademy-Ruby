require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require './lib/codebadges.rb'

USERNAME = 'soumya.ray'
badges_from_file = YAML.load(File.read('./spec/fixtures/badges.yml'))

badges_found = CodeBadges::CodecademyBadges.new(USERNAME).badges

describe 'Get badges for one user' do
  it 'has the right number of badges' do
    badges_found.size.wont_be :<, badges_from_file[USERNAME].size
  end

  badges_from_file[USERNAME].map do |b_name, b_date|
    it "finds '#{b_name}' badge" do
      badges_found[b_name].must_equal Date.parse(b_date)
    end
  end
end

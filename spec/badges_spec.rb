require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'vcr'
require 'webmock/minitest'
require './lib/codebadges.rb'

USERNAME = 'soumya.ray'
badges_from_file = YAML.load(File.read('./spec/fixtures/badges.yml'))

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('badges') do
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
end

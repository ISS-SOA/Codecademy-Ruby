require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require './lib/codebadges/badges.rb'

USERNAME = 'soumya.ray'
badges_from_file = YAML.load(File.read('./spec/fixtures/badges.yml'))

cademy = CodeBadges::CodecademyBadges.new('soumya.ray', 'code5w7r0y')
badges_found = cademy.get_cadet_badges('soumya.ray')


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

require 'minitest/autorun'
require 'minitest/rg'
require './lib/codebadges.rb'

badge = {
  'Sorting Your Friends' => 'May 18, 2014',
  '100 Exercises' => 'May 18, 2014',
  'Max Streak Count of 3' => 'May 11, 2014',
  'Design a Button for Your Website' => 'May  9, 2014',
  'CSS: An Overview' => 'May  9, 2014',
  'Build Your Own Webpage' => 'May  9, 2014',
  '50 Exercises' => 'May  9, 2014',
  'Clickable Photo Page' => 'May  9, 2014',
  'HTML Basics III' => 'May  9, 2014',
  '25 points earned in one day' => 'May  9, 2014',
  'HTML Basics' => 'May  9, 2014',
  '25 Exercises' => 'May  9, 2014',
  '10 Exercises' => 'Dec 12, 2012',
  'Max Streak Count of 1' => 'Dec 12, 2012',
  'First Lesson' => 'Jun 20, 2012'
}

badges_found = CodeBadges::CodecademyBadges.get_badges('soumya.ray')

describe "Get all the badges" do

  it 'has the right number of badges' do
    badges_found.size.must_equal badge.size
  end

  badge.map do |b_name, b_date|
    it "finds '#{b_name}' badge" do
      badges_found[b_name].must_equal Date.parse(badge[b_name])
    end
  end
end

# NOTE: incomplete -- This style of testing is too slow and takes too long!
#       look at badges_test.rb for more optimzed version

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

describe "Get all the badges" do

  before do
    @badges_found = CodeBadges::CodecademyBadges.get_badges('soumya.ray')
  end

  it 'has the right number of badges' do
    @badges_found.size.must_equal badge.size
  end

  it 'finds "Sorting Your Friends" badge' do
    @badges_found['Sorting Your Friends'].must_equal Date.parse(badge['Sorting Your Friends'])
  end

  it 'finds "100 Exercises" badge' do
    @badges_found['100 Exercises'].must_equal Date.parse(badge['100 Exercises'])
  end

  it 'finds "Max Streak Count of 3" badge' do
    @badges_found['Max Streak Count of 3'].must_equal Date.parse(badge['Max Streak Count of 3'])
  end

  it 'finds "Design a Button for Your Website" badge' do
    @badges_found['Design a Button for Your Website'].must_equal Date.parse(badge['Design a Button for Your Website'])
  end

  # TODO: make writing these tests easier and running these tests faster!
end

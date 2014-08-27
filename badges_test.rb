##  PLEASE IGNORE THIS FILE FOR NOW!

require 'minitest/autorun'
require 'minitest/rg'
require 'badges'

badge['Sorting Your Friends'] = 'May 18, 2014'
badge['100 Exercises'] = 'May 18, 2014'
badge['Max Streak Count of 3'] = 'May 11, 2014'
badge['Design a Button for Your Website'] = 'May  9, 2014'
badge['CSS: An Overview'] = 'May  9, 2014'
badge['Build Your Own Webpage'] = 'May  9, 2014'
badge['50 Exercises'] = 'May  9, 2014'
badge['Clickable Photo Page'] = 'May  9, 2014'
badge['HTML Basics III'] = 'May  9, 2014'
badge['25 points earned in one day'] = 'May  9, 2014'
badge['HTML Basics'] = 'May  9, 2014'
badge['25 Exercises'] = 'May  9, 2014'
badge['10 Exercises'] = 'Dec 12, 2012'
badge['Max Streak Count of 1'] = 'Dec 12, 2012'
badge['First Lesson'] = 'Jun 20, 2012'

describe "Finds all the badges" do

  before do
    badges_found = CodecademyBadges.get_badges('soumya.ray')
  end

  it 'finds "Sorting Your Friends" badge' do
    badge['Sorting Your Friends']
  end
end

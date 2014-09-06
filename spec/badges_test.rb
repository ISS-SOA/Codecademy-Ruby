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

badges_from_file = {
  'soumya.ray' => {
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
  },
  'chenlizhan' => {
    'Banking on Ruby' => 'Aug 25, 2014',
    'Object-Oriented Programming II' => 'Aug 25, 2014',
    'Virtual Computer' => 'Aug 25, 2014',
    '500 Exercises' => 'Aug 25, 2014',
    'Object-Oriented Programming I' => 'Aug 22, 2014',
    'Blocks, Procs, and Lambdas' => 'Aug 22, 2014',
    'The Refactor Factory' => 'Aug 21, 2014',
    'The Zen of Ruby' => 'Aug 21, 2014',
    '150 points earned in one day' => 'Aug 21, 2014',
    'A Night at the Movies' => 'Aug 21, 2014',
    'Hashes and Symbols' => 'Aug 21, 2014',
    '125 points earned in one day' => 'Aug 21, 2014',
    'Ordering Your Library' => 'Aug 21, 2014',
    'Methods, Blocks, & Sorting' => 'Aug 21, 2014',
    '100 points earned in one day' => 'Aug 21, 2014',
    'Create a Histogram' => 'Aug 21, 2014',
    'Data Structures' => 'Aug 21, 2014',
    'Redacted!' => 'Aug 21, 2014',
    'Loops & Iterators' => 'Aug 21, 2014',
    'Thith Meanth War!' => 'Aug 21, 2014',
    'Control Flow in Ruby' => 'Aug 21, 2014',
    'Putting the Form in Formatter' => 'Aug 21, 2014',
    'Introduction to Ruby' => 'Aug 21, 2014',
    'File Input/Output' => 'Jul 24, 2014',
    'Max Streak Count of 5' => 'Jul 24, 2014',
    'Classes' => 'Jul 24, 2014',
    'Introduction to Classes' => 'Jul 23, 2014',
    'Introduction to Bitwise Operators' => 'Jul 22, 2014',
    'Advanced Topics in Python' => 'Jul 22, 2014',
    'Exam Statistics' => 'Jul 22, 2014',
    'Max Streak Count of 3' => 'Jul 22, 2014',
    'Practice Makes Perfect' => 'Jul 21, 2014',
    '200 Exercises' => 'Jul 21, 2014',
    '75 points earned in one day' => 'Jul 21, 2014',
    'Loops' => 'Jul 21, 2014',
    'Battleship!' => 'Jul 20, 2014',
    'Lists and Functions' => 'Jul 20, 2014',
    'Student Becomes the Teacher' => 'Jul 20, 2014',
    'PygLatin' => 'Jul 20, 2014',
    'A Day at the Supermarket' => 'Jul 19, 2014',
    'Python Lists and Dictionaries' => 'Jul 19, 2014',
    '100 Exercises' => 'Jul 19, 2014',
    'Taking a Vacation' => 'Jul 19, 2014',
    'Functions' => 'Jul 19, 2014',
    'Conditionals & Control Flow' => 'Jul 18, 2014',
    '50 points earned in one day' => 'Jul 18, 2014',
    '50 Exercises' => 'Jul 18, 2014',
    'Date and Time' => 'Jul 18, 2014',
    'Strings & Console Output' => 'Jul 18, 2014',
    '25 points earned in one day' => 'Jul 18, 2014',
    '25 Exercises' => 'Jul 18, 2014',
    'Tip Calculator' => 'Jul 18, 2014',
    'Python Syntax' => 'Jul 18, 2014',
    'First Lesson' => 'Jul 18, 2014',
    '10 Exercises' => 'Jul 18, 2014',
    'Max Streak Count of 1' => 'Mar 29, 2014'
  }
}

badges_found = CodeBadges::CodecademyBadges.get_badges('soumya.ray')
badges_found_from_file = CodeBadges::CodecademyBadges.get_badges_from_file('./spec/testfiles/test.txt')

describe 'Get all the badges' do

  it 'has the right number of badges' do
    badges_found.size.must_equal badge.size
  end

  badge.map do |b_name, b_date|
    it "finds '#{b_name}' badge" do
      badges_found[b_name].must_equal Date.parse(b_date)
    end
  end
end

describe 'Read file to get the correspond badges information' do
  it 'has the right number of badges for each users' do
    badges_found_from_file.each do |user, badges|
      badges.size.must_equal badges_from_file[user].size
    end
  end

  badges_from_file.map do |user, badges|
    badges.map do |b_name, b_date|
      it "finds '#{b_name}' badge from '#{user}'" do
        badges_found_from_file[user][b_name].must_equal Date.parse(b_date)
      end
    end
  end
end

require 'minitest/autorun'
require 'minitest/rg'
require './lib/codebadges.rb'

cadet_actual = \
{ username: 'soumya.ray',
  badges:
  [{ badge: 'Sorting Your Friends', date: '2014-05-18' },
   { badge: '100 Exercises', date: '2014-05-18' },
   { badge: 'Max Streak Count of 3', date: '2014-05-11' },
   { badge: 'Design a Button for Your Website', date: '2014-05-09' },
   { badge: 'CSS: An Overview', date: '2014-05-09' },
   { badge: 'Build Your Own Webpage', date: '2014-05-09' },
   { badge: '50 Exercises', date: '2014-05-09' },
   { badge: 'Clickable Photo Page', date: '2014-05-09' },
   { badge: 'HTML Basics III', date: '2014-05-09' },
   { badge: '25 points earned in one day', date: '2014-05-09' },
   { badge: 'HTML Basics', date: '2014-05-09' },
   { badge: '25 Exercises', date: '2014-05-09' },
   { badge: '10 Exercises', date: '2012-12-12' },
   { badge: 'Max Streak Count of 1', date: '2012-12-12' },
   { badge: 'First Lesson', date: '2012-06-20' }] }

cadets_actual = \
{ cadets:
  [{ username: 'chenlizhan',
     badges:
     [{ badge: 'Banking on Ruby', date: '2014-08-25' },
      { badge: 'Object-Oriented Programming II', date: '2014-08-25' },
      { badge: 'Virtual Computer', date: '2014-08-25' },
      { badge: '500 Exercises', date: '2014-08-25' },
      { badge: 'Object-Oriented Programming I', date: '2014-08-22' },
      { badge: 'Blocks, Procs, and Lambdas', date: '2014-08-22' },
      { badge: 'The Refactor Factory', date: '2014-08-21' },
      { badge: 'The Zen of Ruby', date: '2014-08-21' },
      { badge: '150 points earned in one day', date: '2014-08-21' },
      { badge: 'A Night at the Movies', date: '2014-08-21' },
      { badge: 'Hashes and Symbols', date: '2014-08-21' },
      { badge: '125 points earned in one day', date: '2014-08-21' },
      { badge: 'Ordering Your Library', date: '2014-08-21' },
      { badge: 'Methods, Blocks, & Sorting', date: '2014-08-21' },
      { badge: '100 points earned in one day', date: '2014-08-21' },
      { badge: 'Create a Histogram', date: '2014-08-21' },
      { badge: 'Data Structures', date: '2014-08-21' },
      { badge: 'Redacted!', date: '2014-08-21' },
      { badge: 'Loops & Iterators', date: '2014-08-21' },
      { badge: 'Thith Meanth War!', date: '2014-08-21' },
      { badge: 'Control Flow in Ruby', date: '2014-08-21' },
      { badge: 'Putting the Form in Formatter', date: '2014-08-21' },
      { badge: 'Introduction to Ruby', date: '2014-08-21' },
      { badge: 'File Input/Output', date: '2014-07-24' },
      { badge: 'Max Streak Count of 5', date: '2014-07-24' },
      { badge: 'Classes', date: '2014-07-24' },
      { badge: 'Introduction to Classes', date: '2014-07-23' },
      { badge: 'Introduction to Bitwise Operators', date: '2014-07-22' },
      { badge: 'Advanced Topics in Python', date: '2014-07-22' },
      { badge: 'Exam Statistics', date: '2014-07-22' },
      { badge: 'Max Streak Count of 3', date: '2014-07-22' },
      { badge: 'Practice Makes Perfect', date: '2014-07-21' },
      { badge: '200 Exercises', date: '2014-07-21' },
      { badge: '75 points earned in one day', date: '2014-07-21' },
      { badge: 'Loops', date: '2014-07-21' },
      { badge: 'Battleship!', date: '2014-07-20' },
      { badge: 'Lists and Functions', date: '2014-07-20' },
      { badge: 'Student Becomes the Teacher', date: '2014-07-20' },
      { badge: 'PygLatin', date: '2014-07-20' },
      { badge: 'A Day at the Supermarket', date: '2014-07-19' },
      { badge: 'Python Lists and Dictionaries', date: '2014-07-19' },
      { badge: '100 Exercises', date: '2014-07-19' },
      { badge: 'Taking a Vacation', date: '2014-07-19' },
      { badge: 'Functions', date: '2014-07-19' },
      { badge: 'Conditionals & Control Flow', date: '2014-07-18' },
      { badge: '50 points earned in one day', date: '2014-07-18' },
      { badge: '50 Exercises', date: '2014-07-18' },
      { badge: 'Date and Time', date: '2014-07-18' },
      { badge: 'Strings & Console Output', date: '2014-07-18' },
      { badge: '25 points earned in one day', date: '2014-07-18' },
      { badge: '25 Exercises', date: '2014-07-18' },
      { badge: 'Tip Calculator', date: '2014-07-18' },
      { badge: 'Python Syntax', date: '2014-07-18' },
      { badge: 'First Lesson', date: '2014-07-18' },
      { badge: '10 Exercises', date: '2014-07-18' },
      { badge: 'Max Streak Count of 1', date: '2014-03-29' }
     ]  },
   { username: 'soumya.ray',
     badges:
     [{ badge: 'Sorting Your Friends', date: '2014-05-18' },
      { badge: '100 Exercises', date: '2014-05-18' },
      { badge: 'Max Streak Count of 3', date: '2014-05-11' },
      { badge: 'Design a Button for Your Website', date: '2014-05-09' },
      { badge: 'CSS: An Overview', date: '2014-05-09' },
      { badge: 'Build Your Own Webpage', date: '2014-05-09' },
      { badge: '50 Exercises', date: '2014-05-09' },
      { badge: 'Clickable Photo Page', date: '2014-05-09' },
      { badge: 'HTML Basics III', date: '2014-05-09' },
      { badge: '25 points earned in one day', date: '2014-05-09' },
      { badge: 'HTML Basics', date: '2014-05-09' },
      { badge: '25 Exercises', date: '2014-05-09' },
      { badge: '10 Exercises', date: '2012-12-12' },
      { badge: 'Max Streak Count of 1', date: '2012-12-12' },
      { badge: 'First Lesson', date: '2012-06-20' }
     ] }
  ] }

cadet_found = CodeBadges::CodecademyBadges.get_badges('soumya.ray')
cadets_found = CodeBadges::Academy.get_cadets(['chenlizhan', 'soumya.ray'])

describe 'Get badges for one user' do
  before do
    @badges_found = cadet_found[:badges]
  end

  it 'has the right number of badges' do
    cadet_found[:badges].size.must_equal cadet_actual[:badges].size
  end

  cadet_actual[:badges].map do |badge_actual|
    it "should find '#{badge_actual[:badge]}' badge" do
      results = cadet_found[:badges].select { |b| b[:badge] == badge_actual[:badge] }
      badge_found = results.first
      badge_found[:date].must_equal Date.parse(badge_actual[:date])
    end
  end
end

describe 'Get badges for multiple users' do
  it 'should have the right number of cadets' do
    num_cadets = cadets_actual[:cadets].size
    cadets_found[:cadets].size.must_equal num_cadets
  end

  it 'has the right number of badges for each user' do
    cadets_found[:cadets].each do |each_cadet|
      search_results = cadets_actual[:cadets].select do |cadet|
        cadet[:username] == each_cadet[:username]
      end
      actual_cadet = search_results.first

      each_cadet[:username].must_equal actual_cadet[:username]
      each_cadet[:badges].size.must_equal actual_cadet[:badges].size
    end
  end

  cadets_actual[:cadets].each do |actual_cadet|
    actual_cadet[:badges].each do |actual_badge|
      it "finds actual badge '#{actual_badge[:badge]}' from actual user '#{actual_cadet[:username]}'" do
        actual_name = actual_cadet[:username]
        found_cadet = cadets_found[:cadets].select { |c| c[:username] == actual_name }.first
        found_badge = found_cadet[:badges].select { |b| b[:badge] == actual_badge[:badge] }.first
        found_badge[:date].must_equal Date.parse(actual_badge[:date])
      end
    end
  end
end

# require 'minitest/autorun'
# require 'minitest/rg'
# require 'yaml'
# require './lib/codebadges.rb'
#
# test_courses = YAML.load(File.read('spec/fixtures/courses.yml'))
#
# codecademy = CodeBadges::CodecademyCourses.new
# courses = codecademy.courses
#
# describe 'Find all test courses' do
#   it 'has the right number of badges' do
#     courses.size.wont_be :<, test_courses.size
#   end
#
#   test_courses.map do |course_name|
#     it "finds course '#{course_name}'" do
#       codecademy.courses.keys.include? course_name
#     end
#   end
# end

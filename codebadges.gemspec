$:.push File.expand_path("../lib", __FILE__)
require 'codebadges/version'

Gem::Specification.new do |s|
  s.name        =  'codebadges'
  s.version     =  CodeBadges::VERSION
  s.executables << 'codebadges'
  s.date        =  '2015-07-21'
  s.summary     =  'Grab the badges information from the Codecademy'
  s.description =  "Takes username and returns user's badges (with dates)"
  s.authors     =  ['Lee Chen', 'Soumya Ray']
  s.email       =  ['chung1350@hotmail.com', 'soumya.ray@gmail.com']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    =  'https://github.com/ISS-SOA/Codecademy-Ruby'
  s.license     =  'MIT'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.add_runtime_dependency 'oga'
end

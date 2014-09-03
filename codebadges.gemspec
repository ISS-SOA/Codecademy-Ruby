$:.push File.expand_path("../lib", __FILE__)
require 'codebadges/version'

Gem::Specification.new do |s|
  s.name        =  'codebadges'
  s.version     =  CodeBadges::VERSION
  s.executables << 'codebadges'

  s.date        =  '2014-09-03'
  s.summary     =  'Grab the badges information from the Codecademy'
  s.description =  'Use username as an input, automatically give you the badges the user has.'
  s.authors     =  ['Lee Chen', 'Soumya Ray']
  s.email       =  'chung1350@hotmail.com'
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    =  'https://github.com/ISS-SOA/Codecademy-Ruby'
  s.license     =  'MIT'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.add_runtime_dependency 'nokogiri', '>= 1.6.2'   # v.1.6.2 has documented problems
end

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'codebadges/version'

Gem::Specification.new do |s|
  s.name        =  'codebadges'
  s.version     =  CodeBadges::VERSION
  s.date        =  CodeBadges::DATE
  s.executables << 'codebadges'
  s.summary     =  'Access user and course information on Codecademy'
  s.description =  'Get user user achievements and course lists from Codecademy'
  s.authors     =  ['Soumya Ray', 'Lee Chen']
  s.email       =  ['soumya.ray@gmail.com', 'chung1350@hotmail.com']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/ISS-SOA/Codecademy-Ruby'
  s.license     =  'MIT'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.add_runtime_dependency 'oga'
  s.add_runtime_dependency 'watir-webdriver'
  s.add_runtime_dependency 'headless'
end

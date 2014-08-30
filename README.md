CodeBadges
===============

CodeBadges. It tries to grabs some information on the Codecademy. What it grab? Badges!

## About

Once you done a section of course on the Codecademy(The online programming tutorial), you will get a badges.
The gem is to understand that what course and the level the user take on the Codecademy.

## Usage

Install it with the following command:
````ruby
gem install codebadges
````

Then in your file:
````ruby
require "codebadges"
CodecademyBadges.get_badges(username)
````
The argument username is the user's account who you want to check it out!
````

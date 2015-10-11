# CodeBadges [![Build Status](https://travis-ci.org/ISS-SOA/Codecademy-Ruby.svg?branch=develop)](https://travis-ci.org/ISS-SOA/Codecademy-Ruby)

Codecademy is a great place to learn coding! Unfortunately, Codecademy's website
doesn't provide an API to help us monitor our own coding.
So we made the CodeBadges gem to scrape user achievements from Codecademy!

Note that we respect Codecademy's `robots.txt`

## Usage

Install it with the following command:
```sh
$ gem install codebadges
```

Or else put it in your `Gemfile` as:
```ruby
gem codebadges
```

Run it from the command line. For example, to get the achievements of user `chenlizhan`:
```
$ codebadges chenlizhan
```

Or use it from your Ruby code:
````ruby
require 'codebadges'
lee = CodeBadges::CodecademyBadges.new('chenlizhan')
badges = lee.badges
````

# CodeBadges [![Gem Version](https://badge.fury.io/rb/codebadges.svg)](https://badge.fury.io/rb/codebadges)[![Build Status](https://travis-ci.org/ISS-SOA/Codecademy-Ruby.svg?branch=develop)](https://travis-ci.org/ISS-SOA/Codecademy-Ruby)

Codecademy is a great place to learn coding! Unfortunately, Codecademy's website
doesn't provide an API.

So we made the CodeBadges gem to scrape user achievements from Codecademy!

Note that we respect Codecademy's `robots.txt`

## Installation

Install it with the following command:
```sh
$ gem install codebadges
```

Or else put it in your `Gemfile` as:
```ruby
gem codebadges
```
and run `bundle install`.

## Usage

### CLI: Finding user badges
Run it from the command line. For example, to get the achievements of user `chenlizhan`:
```
$ codebadges chenlizhan
```

You will be required to enter username/password credentials to access codecademy user achievements.
This gem *never* stores your credentials nor uses them for any other purpose.
### Code: Finding user badges
Use it from your Ruby code:
````ruby
require 'codebadges'

cademy_badges = CodeBadges::GetCodecademyBadges.new('my_username', 'my_password')
badges = cademy_badges.call('chenlizhan')
````

### Code: Finding full course list
Use it from your Ruby code:
```ruby
courses = CodeBadges::GetCodecademyCourses.call
```

## Testing

First, setup environment variables called `CC_USERNAME` and `CC_PASSWORD` with your Codecademy username and password.

Then:
```
rake spec
```

Alternatively:
```
CC_USERNAME=myusername CC_PASSWORD=mypassword rake spec
```

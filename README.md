# Brownfield Of Dreams

Brownfield of Dreams is a Mod 3 Back-End Ruby on Rails application project at Turing School of Software and Design. This project is designed to have students work off brownfield code, enhancing an already-existing codebase for housing video tutorials for online learning. Each tutorial is a playlist of video segments. 

Within the application, an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags. A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered, a user can bookmark any of the segments in a tutorial page.

Throughout the course of this project, we enhanced the abilities of three different users - admin, logged in users, and visitors to the site. With this, we limited what non-logged in users had access to (certain videos, bookmarking features, and friending features), and limited what non-admin users had access to (editing/deleting existing tutorials). 


## Contributors
Brownfield of Dreams was created by Josh Sherwood and Leiya Kenney as a Back End Mod 3 project at Turing School of Software and Design


## Versions
* Ruby 2.4.1
* Rails 5.2.0

## Tech Stack
* Brownfield of Dreams is a Ruby on Rails application 
* PostgreSQL database
* Production hosted on Heroku

## Production
https://obscure-hollows-78575.herokuapp.com/

## Local Setup

First you'll need to setup an API key with YouTube and have it defined within `ENV['YOUTUBE_API_KEY']`.
Then: 
```
$ git clone
```

```
$ bundle install
```

```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

## To Run the Test Suite:
```ruby
$ bundle exec rspec
```

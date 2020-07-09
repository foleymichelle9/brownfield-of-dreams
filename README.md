# Brownfield of Dreams (Turing Tutorials)

BE MOD3 Group Project 1

[Visit Our Brownfiled of Dreams Application] [https://tragically-canoe-07528.herokuapp.com/]

** Team Members **
[Michelle Foley] [https://github.com/foleymichelle9]
[Sage Lee] [https://github.com/sagemlee]
[Melanie Tran] [https://github.com/melatran]

## Background Information

This is a Ruby on Rails application called Turing Tutorials. It is used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments implemented using YouTube's API. The app also allows users to connect to their GitHub account to retrive information about their repos, followers, and see who they're following. There are two types of users (default regular user and an admin). Both roles have different functionality and power.

### Prerequisits

- Ruby 2.4.1
- Rails 5.2.0

### Technologies

* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

### Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn
```

Set up the database
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

Run the tests
```
bundle exec rspec
```

#### Youtube API

This project makes use of the Youtube API.

First, obtain an API key by following steps 1 - 3 in [this guide](https://developers.google.com/youtube/v3/getting-started) for the "Before you Start" section. When creating new credentials, make sure you choose the "API Key" option. Make sure that you follow the step to enable the Youtube Data API. Your API key will not work without that step.

Once you have obtained an API key and enabled the API:

1. Run `bundle exec figaro install`
1. This will create the file `config/application.yml`. Open that file.
1. Append the following to that file: `YOUTUBE_API_KEY: <your api key>`, `replacing <your api key>` with the api key you just obtained.

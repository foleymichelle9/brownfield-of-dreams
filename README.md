# Brownfield of Dreams (Turing Tutorials)

BE MOD3 Group Project 1

[Visit Our Brownfiled of Dreams Application](https://tragically-canoe-07528.herokuapp.com/)

**Team Members**

[Michelle Foley](https://github.com/foleymichelle9)

[Sage Lee](https://github.com/sagemlee)

[Melanie Tran](https://github.com/melatran)

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

### GitHub Connection

Once a user/admin is registered to the website, they have the option of connecting to their GitHub account using the OAuth process to retrieve a user specific token automatically. Prior to making the connection, the dashboard will not display a user's repos, followers, or who they're following. When the connection is made, users have access to their repos, followers, and following. Each display is linked to the repo or that user's GitHub account. The image shows the account before GitHub authorization. There will not be an image display after the connection is made to provide security for our user's information.

<img width="1217" alt="Screen Shot 2020-07-09 at 6 50 11 AM" src="https://user-images.githubusercontent.com/59414750/87042479-f3fbed00-c1b0-11ea-9163-5d90f6321fb9.png">

### Admin

- Can create tags for each tutorial in the database
- Can import playlists from YouTube
- Can create, edit, and delete tutorials

![giphy](https://user-images.githubusercontent.com/59414750/87041204-23a9f580-c1af-11ea-8e07-d9258bd5ee95.gif)

### User

- Can display their repos, followers, and see who they're following on GitHub
- Can bookmark videos from tutorials created
- Cannot upload, edit, or delete tutorials
- If an account they are following on GitHub has an account with Turing Tutorials, an `Add Friend` button will appear
- Users have to activate their emails
- Users can send invites to their friends with GitHub accounts who have yet to create an account with Turing Tutorials



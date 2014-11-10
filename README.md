# Skore

Skore is a gem that has basic function is to analyze the social score of a user of different platforms like **Klout, Kred and PeerIndex**

## Installation

Add this line to your application's Gemfile:

    gem 'skore'

Or install it yourself as:

    $ gem install skore

## Usage

Using skore is quite simple, just having the right to feed each of the platforms **(klout, kred, & PeerIndex)** and the user that you want to identify keys. 

### Get Klout Score

    user = Skore::KloutSkore.new(API_KEY, TWITTER_USERNAME)
    puts user.score


return float number like 55.394093

if you want to round the score simply add true method to ```score```

    score = Skore::KloutSkore.new(@klout_api_key).score(username, true)

return 55 

### Get Kred Score

    score = Skore::Kred.new(@kred_app_id, @kred_app_key).score(social_network.to_sym, username)

return number like 777 


### Get PeerIndex Score 

    score = Skore::PeerIndex.new(@peerindex_api_key).score(username)

return number like 30

### Or get it for all(Only twitter)

    scores = Skore::SkoreUtil.new({klout_api_key: '', peerindex_api_key: '', kred_app_id: '', kred_app_key: ''}).score('twitter', 'mrkaspa')
    scores = Skore::SkoreUtil.new({klout_api_key: ''}).score('instagram', 'mrkaspa')

## Contributing

1. Fork it ( https://github.com/kreattiewe/skore/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

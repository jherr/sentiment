# Sentiment

Simple Sentiment Analysis

## Installation

Add this line to your application's Gemfile:

    gem 'sentiment'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sentiment

## Usage

Call Sentiment.sentiment with the string you want to parse. This will return a results object that includes a score, which is negative for a negative sentiment and positive for a positive sentiment. It will also return a comparative score which is the average of negative or positive words over the entire string. The results object also contains a list of the tokens and the words that it found.

This is a simple dictionary based mechanism. Each word is given a numeric sentiment value and those values are added up as they are found in the string after punctuation is removed.

If your string contains HTML or any other type of markup you will need to remove that before sending it into the Sentiment mechanism.

This is a port of:

https://github.com/thisandagain/sentiment

Which is largely the same algorithm for node.js. This version includes one refinement which is some extra code to handle a few two-word cases that appear in the dictionary.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

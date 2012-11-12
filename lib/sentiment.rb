require 'sentiment/version'
require 'sentiment/dictionary'
require 'sentiment/result'

module Sentiment
	@@doubles = nil

	def self.sentiment( str )
		str.downcase!

		if ( @@doubles == nil )
			@@doubles = []
			Sentiment::WORD_LIST.each { |word,val|
				next unless( word =~ /\s/ )
				@@doubles.push( word )
			}
		end

		words = []
		dbl_tokens = []
		score = 0

		@@doubles.each { |dbl|
			next unless ( str =~ /#{dbl}/ )
			str.gsub!( /#{dbl}/ ) {
				score += Sentiment::WORD_LIST[ dbl ]
				words.push( dbl )
				dbl_tokens.push( dbl )
				""
			}
		}

		tokens = tokenize( str )
		tokens.each { |word|
			val = Sentiment::WORD_LIST[ word ]
			next unless ( val )
			score += val
			words.push( word )
		}

		Result.new( score, tokens | dbl_tokens, words )
	end

private
	def self.tokenize( str )
		str
			.gsub(/[^a-zA-Z ]+/, '')
			.gsub('/ {2,}/',' ')
			.split( /\s+/ )
	end
end

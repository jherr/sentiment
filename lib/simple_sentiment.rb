require 'simple_sentiment/version'
require 'simple_sentiment/dictionary'
require 'simple_sentiment/result'

module SimpleSentiment
	@@doubles = nil

	def self.sentiment( str )
		str.downcase!

		if ( @@doubles == nil )
			@@doubles = []
			SimpleSentiment::WORD_LIST.each { |word,val|
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
				score += SimpleSentiment::WORD_LIST[ dbl ]
				words.push( dbl )
				dbl_tokens.push( dbl )
				""
			}
		}

		tokens = tokenize( str )
		tokens.each { |word|
			val = SimpleSentiment::WORD_LIST[ word ]
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

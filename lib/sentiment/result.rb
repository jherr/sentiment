module Sentiment
	class Result
		attr_reader :score, :comparative, :tokens, :words
		def initialize( score, tokens, words )
			@score = score
			@comparative = score / tokens.length
			@tokens = tokens
			@words = words
		end
	end
end

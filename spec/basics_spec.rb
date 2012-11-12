require 'simple_sentiment'

include SimpleSentiment

describe SimpleSentiment do
	it "Examples of doubles" do
		SimpleSentiment.sentiment( 'This is not good!' ).score.should == -2
		SimpleSentiment.sentiment( 'This is not good! This is really not good!' ).score.should == -4
	end

	it "Negative sentiment example" do
		result = SimpleSentiment.sentiment( 'Hey you worthless scumbag' )
		result.score.should == -6
		result.comparative.should == -2
		result.tokens.should == ["hey", "you", "worthless", "scumbag"]
		result.words.should == ["worthless", "scumbag"]

		result = SimpleSentiment.sentiment( 'Cats are stupid.' )
		result.score.should == -2
		result.comparative.should == -1
		result.tokens.should == ["cats", "are", "stupid"]
		result.words.should == ["stupid"]
	end

	it "Positive sentiment examples" do
		result = SimpleSentiment.sentiment( 'This is so cool' )
		result.score.should == 1
		result.comparative.should == 0
		result.tokens.should == ["this", "is", "so", "cool"]
		result.words.should == ["cool"]
	end
end

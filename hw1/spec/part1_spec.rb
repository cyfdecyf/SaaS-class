require_relative '../part1.rb'

describe 'palindrome?' do
	it "return true for plaindrome" do
		palindrome?("AbcBA").should == true
	end

	it "ignores non-word character" do
		palindrome?("Madam, I'm Adam!").should == true
		palindrome?("A man, a plan, a canal -- Panama").should == true
	end

	it "returns false for other string" do
		palindrome?("ASDFniasdf").should == false
		palindrome?("as!!a,.ijn").should == false
	end
end

describe 'count_words' do
	it 'return the count of words in a sentence' do
		cnt = count_words("Doo bee doo bee doo")
		cnt.should == {'doo' => 3, 'bee' => 2}

		cnt = count_words("A man, a plan, a canal -- Panama")
		cnt.should == {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1} 
	end
end
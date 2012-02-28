require_relative '../part3.rb'

describe 'count_words' do
	it 'groups anagrams' do
		words = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
		combine_anagrams(words).size.should == 5
	end

	it 'should ignore case and reserve case' do
		words = ['cars', 'fOr', 'potaToEs', 'seotatop', 'raCs', 'foUr','sCar', 'creAMs', 'sCream']
		grp = combine_anagrams(words)
		grp.size.should == 5

		found = false
		grp.flatten.grep("fOr").size.should > 0
	end
end
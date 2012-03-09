require_relative '../part1.rb'

# a)

describe Numeric do
	it "converts the value of currency" do
		5.dollars.should == 5
		5.in(:euros).should == 5 / 1.292
		10.euros.in(:rupees).should == 10 * 1.292 / 0.019
	end
end

# b)
describe String do
	it "return true for plaindrome" do
		"AbcBA".palindrome?.should == true
	end

	it "ignores non-word character" do
		"Madam, I'm Adam!".palindrome?.should == true
		"A man, a plan, a canal -- Panama".palindrome?.should == true
	end

	it "returns false for other string" do
		"ASDFniasdf".palindrome?.should == false
		"as!!a,.ijn".palindrome?.should == false
	end
end

# b)
describe Enumerable do
	it "return true for plaindrome Enumerable" do
		[1].palindrome?.should == true
		[1,2,3,2,1].palindrome?.should == true
		[1,2,3,4,4,3,2,1].palindrome?.should == true
		["n", "s", "blla", "s", "n"].palindrome?.should == true
		["n", "s", "s", "n"].palindrome?.should == true

		["s", "s", "n"].palindrome?.should == false
		["s", "n"].palindrome?.should == false
	end
end

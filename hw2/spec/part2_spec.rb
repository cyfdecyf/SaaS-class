require_relative '../part2.rb'

describe CartesianProduct do
	it "returns the catesian product of two array" do
		c = CartesianProduct.new([:a,:b], [4,5])
		c.to_a == [[:a, 4], [:a, 5], [:b, 4], [:b, 5]]

		c = CartesianProduct.new([:a,:b], [])
		c.to_a.should == []
end
end

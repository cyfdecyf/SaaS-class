require_relative '../part5.rb'

class Foo
	attr_accessor_with_history :bar
end

describe Class do
	it "records the histroy of assignment" do
		f = Foo.new
		f.bar = 3
		f.bar = :wowzo
		f.bar = 'boo!'
		f.bar_history.should == [nil, 3, :wowzo, 'boo!']

		f2 = Foo.new
		f2.bar = 4
		f2.bar_history.should == [nil, 4]
	end

	it "histroy should return nil if non-assignement is done" do
		f = Foo.new
		f.bar_history.should == nil
	end
end
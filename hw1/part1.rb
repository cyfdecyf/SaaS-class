def palindrome?(s)
	s = s.downcase.gsub(/\W/, '')
	s == s.reverse
end

def count_words(s)
	res = Hash.new(0)
	s.downcase.scan(/\b\w+\b/) do |pat|
		res[pat] += 1
	end
	res
end

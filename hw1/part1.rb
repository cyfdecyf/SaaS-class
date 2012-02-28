def palindrome?(s)
	s = s.downcase.gsub(/\W/, '')
	s == s.reverse
end

def count_words(s)
	res = {}
	res.default = 0
	s.downcase.gsub(/\w*\b/) do |pat|
		res[pat] += 1 if pat != ''
	end
	res
end

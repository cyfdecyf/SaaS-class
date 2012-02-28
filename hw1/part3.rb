def combine_anagrams(words)
	grp = {}
	words.each do |word|
		key = word.downcase.each_byte.inject([]) { |s, c| s << c }
		key.sort!
		grp[key] = [] unless grp[key]
		grp[key] << word
	end
	grp.values
end
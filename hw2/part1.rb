 # a)

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = singular(method_id)
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    self / @@currencies[singular(currency)]
  end

private
  def singular(currency)
    currency.to_s.gsub(/s$/, '')
  end
end

# b)

class String
  def palindrome?
    s = self.downcase.gsub(/\W/, '')
    s == s.reverse
  end
end

# c)

module Enumerable
  def palindrome?
    a = self.to_a
    a == a.reverse
  end
end

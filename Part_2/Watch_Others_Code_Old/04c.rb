# Write a method that will generate random English math problems. The method should take a length, then return a math phrase with that many operations.

NUMBERS = %w(zero one two three four five six seven eight nine)
OPERATORS = %w(plus minus times divided)

def mathphrase(length)
  phrase = ""
  phrase << NUMBERS.sample << " " << OPERATORS.sample << " " << NUMBERS.sample
  if length > 1
    (length - 1).times do
      phrase << " " << OPERATORS.sample << " " << NUMBERS.sample
    end
  end
  phrase.gsub!("divided", "divided by")
  phrase
end

p mathphrase(1) # => 'five minus two' (example)
p mathphrase(2) # => 'two plus three times eight' (example)
p mathphrase(3) # => 'one divided by three plus five times zero' (example)

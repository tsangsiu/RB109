ALPHABETS = [nil] + ("a".."z").to_a

def alphabet_position(str)
  alphabets = str.downcase.gsub(/[^a-z]/, '').chars
  alphabets.map do |alphabet|
    ALPHABETS.index(alphabet)
  end.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

=begin

Problem
- Given a String, return the letter count in a Hash
- Use 'letter' as keys
- Use 'count' as values
- The keys must be symbols

Example
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

Data Structure
- Input: String
- Intermediate: Hash
- Output: Hash

Algorithm
- Initialize a empty Hash `count`, with a default value `0`
- Iterate through each character in the given String,
  - Tally each character
- Return `count`

=end

# this method counts lowercase letters only
def letter_count(string)
  count = Hash.new(0)
  string.chars.each do |char|
    count[char.to_sym] += 1 if ('a'..'z').include?(char)
  end
  count
end

# this method ignores the case of the letters
def letter_count(string)
  count = Hash.new(0)
  string.chars.each do |char|
    count[char.downcase.to_sym] += 1 if ('a'..'z').include?(char.downcase)
  end
  count
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

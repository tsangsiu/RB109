=begin

Problem
Rules:
- Given two strings: `str1` and `str2`
  - if a portion of `str1` can be REARRANGED to match `str2`
    - return true
    - else return false
- Only LOWER CASE letters will be used
- No punctuation or digits will be included
Input: String
Output: Boolean

Examples
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true

Data Structures
Input: String
Intermediate: String
Output: Boolean

Algorithm
- Given two strings `str1` and `str2`
  - loop through each character in `str2`
  - if that character exist in `str1`
    - remove that character in `str1`
  - else
    - return false
- return true
  
=end

# Code
def scramble(str1, str2)
  str2.each_char do |char|
    if str1.include?(char)
      str1 = str1.sub(char, '')
    else
      return false
    end
  end
  true
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true

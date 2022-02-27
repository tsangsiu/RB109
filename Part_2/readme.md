# PEDAC Practice

## Problem Lists
- [Codewars Practice Problems](https://docs.google.com/document/d/1usQUJQFr6PGVo3ZWgMi3nVtDRdeUuOUNRtZPtSKkYuE/edit#heading=h.8sf25q8ccj8w) by Christian Larwood

## Resources
- [Study Guide Companion Materials](https://docs.google.com/document/d/1DmmqXC1GLADlFoFmvIeZmvvLnO-wP3cPmPvjIe5vbEw/edit) by Megan Turley

## List of Problems Solved
| Date | Problem | Remark |
| --- | --- | --- |
| 20220227 | [#15, Codewars] [Take a Ten-Minute Walk](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220227.rb) | :star:
| 20220226 | [#14, Codewars] [Dubstep](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220226.rb) |
| 20220225 | [#13, Codewars] [Kebabize](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220225.rb) |
| 20220224B | [#12, Codewars] [Detect Pangram](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220224B.rb) |
| 20220224 | [#11, Codewars] [Extract the Domain Name From a URL](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220224.rb) | :star:
| 20220223 | [Study Session (Advanced)] [Maximum Occurrence of Elements in an Array](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220223.rb) |
| 20220222 | [#10, Codewars] [Most Frequently Used Words in a Text](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220222.rb) | :star::star::star:
| 20220221 | [#9, Codewars] [Typoglycemia Generator](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220221.rb) | :star::star:
| 20220220 | [#8, Codewars] [Repeated Substring](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220220.rb) | :star:
| 20220219 | [#7, Codewars] [Substring Fun](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220219.rb) |
| 20220218B | [#6, Codewars] [Non-Even Substring](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220218B.rb) |
| 20220218 | [#5, Codewars] [Longest Vowel Chain](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220218.rb) |
| 20220217C | [#4, Codewars] [Alphabet Symmetry](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220217C.rb) |
| 20220217B | [#3, Codewars] [Return Substring Instance Count](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220217B.rb) | :star: |
| 20220217 | [#2, Codewars] [Find All Pairs](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220217.rb) | :star: |
| 20220216B | [#1, Codewars] [Count Letters in a String](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220216B.rb) |
| 20220216 | [Study Session] [Sum of Integers in a String](https://github.com/tsangsiu/RB109/blob/main/Part_2/20220216.rb) |
| 20220215 | [#1, Medium 2] [Longest Sentence](https://github.com/tsangsiu/RB101_Programming_Foundations/blob/main/Small_Problems/12_Medium_2/01.rb) |

## Notes

### 20220224
#### `String#split` with Regular Expressions
````ruby
str = 'abc.def/ghi?'
str.split(/\.|\/|\?/) # => ["abc", "def", "ghi"]
str.split(/(\.)|(\/)|(\?)/) # => ["abc", ".", "def", "/", "ghi", "?"], why?
````

### 20220222
#### Regular Expressions
````ruby
# to split at non-alphabets and non-apostrophes
"I won't give up".split(/[^a-zA-Z']/) # => ["I", "won't", "give", "up"]

# to check if a string is purely apostrophes
"'''''".match?(/'+/) # => true
"  '  ".match?(/'+/) # => true

"'''''".match?(/^'+$/) # => true
"  '  ".match?(/^'+$/) # => false
````

### 20220221
#### `Array#delete` and `Array#delete_at`
- `Array#delete` deletes all elements as specified by the argument.
````ruby
array = [1, 2, 2, 3]
array.delete(2) # => returns 2
array # => [1, 3]
````
- `Array#delete_at` deletes the element at the specified position.
````ruby
array = [1, 2, 2, 3]
array.delete_at(2) # => returns 2
array # => [1, 2, 3]
````
- Both the above methods are destructive.

### 20220218B
#### Substrings
- A substring of the original string must be consecutive.
- For example, `"1"`, `"134"` and `"1341"` are substrings of `"1341"`, while `"11"` and `"113"` are not.
### 20220218
#### `Array#each` and `String#each_char`
I used to use both `String#split` and `Array#each` to iterate through each character. I could've used only `String#each_char` instead.
````ruby
str = 'ABC'
str.split('').each do |char|
  puts char
end
# => A B C

str = 'ABC'
str.each_char do |char|
  puts char
end
# => A B C
````


### 20220217B
#### `String#count` vs `String#scan`
- `String#count` counts the intersection of sets defined by the arguments.
````ruby
# count the number of 'b' ({'b', 'b'} = {'b'})
'abbc'.count('bb') # => 2

# count the number of 'b', which is the instersection of {'a', 'b'} and {'b', 'c'}
'abbc'.count('ab', 'bc') # => 2

# count the number of non-'b'
'abbc'.count('^b') # => 2
````
- `String#scan`, however, returns an array of substrings which match the given pattern.
````ruby
'abbc'.scan('bb') # => ["bb"]
'abbc'.scan(/bb/) # => ["bb"]
'abbbbbc'.scan(/bb/) # => ["bb", "bb"]
````
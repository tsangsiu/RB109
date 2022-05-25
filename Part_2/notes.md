# Notes

*This note contains miscellaneous stuff which I find it's good to know when preparing for the interview assessment.*

## Miscellaneous

### To check if an object is a String/Array/Hash, etc

```ruby
'ABC'.class == String # => true
123.class == Integer # => true
3.1415926.class == Float # => true
[1, 2, 3, 4, 5].class == Array # => true
```

## Enumerable

### :thumbsup: `Enumerable#slice_when`

To slice an Array when a certain condition is satisfied

```ruby
str = "0000110111100000111111"

arr_sliced = str.chars.slice_when do |a, b|
  a != b
end.to_a

p arr_sliced # => [["0", "0", "0", "0"], ["1", "1"], ["0"], ["1", "1", "1", "1"], ["0", "0", "0", "0", "0"], ["1", "1", "1", "1", "1", "1"]]
```

### `Enumerable#group_by`

```ruby
(1..6).group_by { |num| num % 3} # => {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}

"deeedbbcccbdaa".chars.group_by { |char| char }
# => {"a"=>["a", "a"], "b"=>["b", "b", "b"], "c"=>["c", "c", "c"], "d"=>["d", "d", "d"], "e"=>["e", "e", "e"]}
```

### `Enumerable#each_with_index` and [`Enumerator#with_index`](https://ruby-doc.org/core-2.5.0/Enumerator.html#method-i-with_index)

The `with_index` method takes an optional parameter to offset the starting index. `each_with_index` does the same thing, but has no optional starting index.

```ruby
[:foo, :bar, :baz].each.with_index(2) do |value, index|
  puts "#{index}: #{value}"
end
# => 2: foo
# => 3: bar
# => 4: baz

[:foo, :bar, :baz].each_with_index do |value, index|
  puts "#{index}: #{value}"
end
# => 0: foo
# => 1: bar
# => 2: baz
```

## Strings

### `String#squeeze`

- To compress the same consecutive characters into one

```ruby
str = 'a      b c               d'
str.squeeze(' ') # => "a b c d"

str = 'aaaabbbbbcccccdddd'
str.squeeze('abcd') # => "abcd"
```

### `String#delete`

- `String#delete` is a non-mutating method, despite the fact that `Array#delete` is destructive.

```ruby
str = "He's handsome!"
str.delete("^a-zA-Z' ") # => "He's handsome"
str # => "He's handsome!"
```

### Ways to Remove a Character from a String: `String#delete`, `String#gsub` and `String#sub`

- `String#delete` and `String#gsub` remove all characters as specified by the argument.

```ruby
str = "abcabcabc"
str.delete("a") # => "bcbcbc"
str # => "abcabcabc" (String#delete is not destructive)

str = "abcabcabc"
str.gsub("a", "") # => "bcbcbc"
str # => "abcabcabc"
```

- `String#sub` removes the first occurrence of the character as specified by the argument.

```ruby
str = "abcabcabc"
str.sub("a", "") # => "bcabcabc"
```

### `String#index`

- `String#index` returns the index position of the first occurrence of the argument

```ruby
'abbccc'.index('c') # => 3
```

- We can also specify the starting position

```ruby
'abbccc'.index(/c/, 5) # => 5
```

- :bulb: A negative offset position is just another way to specify an offset position. It works like indices in collection objects. The `String#index` method still looks for the target substring from **left to right**.

```ruby
# the below two expressions are equivalent
'abbccc'.index(/b/, -1) # => nil
'abbccc'.index(/b/, 5) # => nil
```

### `String#count` and `String#scan`

- `String#count` counts the intersection of sets defined by the arguments..

```ruby
# count the number of 'b' ({'b', 'b'} = {'b'})
'abbc'.count('bb') # => 2

# count the number of 'b', which is the instersection of {'a', 'b'} and {'b', 'c'}
'abbc'.count('ab', 'bc') # => 2

# count the number of non-'b'
'abbc'.count('^b') # => 2
```

Note that `String#count` does not take `Regexp` objects.

- `String#scan`, however, returns an array of substrings which match the given pattern.

```ruby
'abbc'.scan('bb') # => ["bb"]
'abbc'.scan(/bb/) # => ["bb"]
'abbbbbc'.scan(/bb/) # => ["bb", "bb"]
```

### `String#downcase` and `String#upcase`

I usually mix up these method names with other programming languages.

```ruby
'A'.downcase # => 'a'
'a'.upcase # => 'A'
```

### To check if a character is a lowercase letter

```ruby
('a'..'z').include?('a') # => true
```

### Substrings

#### Concepts

A substring of the original string must be consecutive. For example, `"1"`, `"134"` and `"1341"` are substrings of `"1341"`, while `"11"` and `"113"` are not.

#### Slicing Strings

There are several ways to slice a String to get a substring.

```ruby
str = '0123456789'

str[1..5] # => "12345"
str[1...5] # => "1234"
str.slice(1, 5) # => "12345"
```

### To remove characters from a String

- To remove only one specific character from a String when there are more than one of that character

```ruby
str = 'abbccc'
str.sub!('c', '') # => 'abbccc'
str # => 'abbcc'
```

- To remove all occurrences of a specific character from a String

```ruby
str = 'abbccc'
str.gsub!('c', '') # => 'abb'
str # => 'abb'
```

- If the substring to be deleted does not exist, both `String#sub!` and `String#gsub!` returns `nil`

```ruby
str = 'abbccc'

str.sub!('e', '') # => nil
str # => 'abbccc'

str.gsub!('e', '') # => nil
str # => 'abbccc'
```

- We can use regular expressions in `String#sub!` and `String#gsub!`

```ruby
str = 'abbccc'
str.sub!(/[^aeiou]/, '') # => 'abccc'
str # => 'abccc'

str = 'abbccc'
str.gsub!(/[^aeiou]/, '') # => 'a'
str # => 'a'
```

### `String#split` with Regular Expressions

```ruby
str = 'abc.def/ghi?'
str.split(/\.|\/|\?/) # => ["abc", "def", "ghi"]
str.split(/(\.)|(\/)|(\?)/) # => ["abc", ".", "def", "/", "ghi", "?"], why?
```

## Arrays

### `Array#delete` and `String#delete`

Unlike `String#delete`, `Array#delete` is destructive.

```ruby
str = "abcabcabc"
str.delete("a") # => "bcbcbc"
str # => "abcabcabc"

array = [1, 2, 2, 3]
array.delete(2) # => returns 2
array # => [1, 3]
```

### To delete only one specific element in an Array when there are more than one of that element

We cannot use `Array#delete` here, because it is a mutating method that deletes all elements as specified by the argument.

```ruby
array = [1, 2, 2, 3]
array.delete(2) # => 2
array # => [1, 3]
```

`Array#delete_at` is a mutating method that deletes the element at the specifed index position.

```ruby
array = [1, 2, 2, 3]
array.delete_at(2) # => 2
array # => [1, 2, 3]
```

`Array#index` returns the index position of the **first** element as specified by the argument. If the specified element does not exist in the calling Array, it returns `nil`.

```ruby
array = [1, 2, 2, 3]
array.index(2) # => 1
array.index(99) # => nil
```

:bulb: We can combine both `Array#delete_at` and `Array#index` to delete only one specific element in an Array when there are more than one of that element.

```ruby
array = [1, 1, 2, 2, 2, 3]
array.delete_at(array.index(2)) # => 2
array # => [1, 1, 2, 2, 3]
```

### `Enumerable#each_with_object`

You can't use immutable objects like numbers, `true` or `false` as the memo.

```ruby
(1..5).each_with_object(1) { |value, memo| memo *= value } # => 1
```

### `Enumerable#max_by` and `Enumerable#min_by`

- `Enumerable#max_by` and `Enumerable#min_by` return only the first object for which the block returns a truthy value.

```ruby
strings = ['a', 'boy', 'car', 'toy']
strings.max_by { |str| str.length } # => 'boy'
```

### `Enumerable#inject` and `Enumerable#reduce`

- They are aliases.
- [Reference](https://medium.com/@terrancekoar/inject-method-explained-ed531eff9af8)

### `Enumerable#sort_by`

- The result is not quaranteed to be stable. When two keys are equal, the order of the corresponding elements is unpredictable.

```ruby
"A b B a".delete("^a-zA-Z").chars.sort_by(&:downcase)
# => ["A", "a", "b", "B"]
# Note the "b" and "B", they follow the order in the original string.

"The Holy Bible".delete("^a-zA-Z").chars.sort_by(&:downcase)
# => ["B", "b", "e", "e", "H", "h", "i", "l", "l", "o", "T", "y"]
# Note the "H" and "h", they do not follow the order in the original string.
```

## Regular Expressions

### Exercises to brush up regex

- [#7, Medium 1](https://github.com/tsangsiu/RB101_Programming_Foundations/blob/main/Small_Problems/11_Medium_1/07.rb)
- [#1, Medium 2](https://github.com/tsangsiu/RB101_Programming_Foundations/blob/main/Small_Problems/12_Medium_2/01.rb)

### Splitting a String at a Word Boundary

```ruby
"Input Example".split # => ["Input", "Example"]
"Input Example".split(/\b/) # => ["Input", " ", "Example"]

"  Input   Example  ".split # => ["Input", "Example"]
"  Input   Example  ".split(/\b/) # => ["  ", "Input", "   ", "Example", "  "]

"How are you?".split # => ["How", "are", "you?"]
"How are you?".split(/\b/) # => ["How", " ", "are", " ", "you", "?"]
```

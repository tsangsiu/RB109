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

## Strings

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

## Arrays

### `Enumerable#each_with_index` and [`Enumerator#with_index`](https://ruby-doc.org/core-2.5.0/Enumerator.html#method-i-with_index)

The `with_index` method takes an optional parameter to offset the starting index. `each_with_index` does the same thing, but has no optional starting index.

````ruby
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
````

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

## Regular Expressions

### Exercises to brush up regex

[#7, Medium 1](https://github.com/tsangsiu/RB101_Programming_Foundations/blob/main/Small_Problems/11_Medium_1/07.rb)
[#1, Medium 2](https://github.com/tsangsiu/RB101_Programming_Foundations/blob/main/Small_Problems/12_Medium_2/01.rb)

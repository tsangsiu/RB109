# Notes

*This note contains miscellaneous stuff which I find it's good to know when preparing for the interview assessment.*

## Strings

### Substrings

A substring of the original string must be consecutive. For example, `"1"`, `"134"` and `"1341"` are substrings of `"1341"`, while `"11"` and `"113"` are not.

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

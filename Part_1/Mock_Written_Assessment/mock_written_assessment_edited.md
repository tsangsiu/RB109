# Mock Written Assessment (Edited)

Start Date and Time: 2022-04-22T21:00

Finish Date and Time: 2022-04-22T23:35

Submit Date and Time: 2022-04-22T23:55

## 1

````ruby
a = 10            # 1
                  # 2
while true do     # 3
  a = 5           # 4
  break           # 5
end               # 6
                  # 7
puts a            # 8
````

On line 1, the local variable `a` is initialized to the Integer `10`.

Within the **`while`** loop on lines 3 to 6, the local variable `a` is re-assigned to a new Integer `5`.

Therefore, when the `puts` method is called with an argument `a`, it outputs `5` to the console.

21:02

### Note for #1

- `while` on line 3 is a keyword, rather than a method inovcation. Therefore, the `do...end` on lines 3 to 6 does not constitute a block. Therefore, even if we initialize `a` inside the `do...end`, it is still accessible outside it.

````ruby
while true do
  a = 5
  break
end

puts a # => 5
````

## 2

````ruby
def some_method     # 1
  a = 1             # 2
  5.times do        # 3
    puts a          # 4
    b = 2           # 5
  end               # 6
                    # 7
  puts a            # 8
  puts b            # 9
end                 # 10
                    # 11
some_method         # 12
````

On line 12, the method `some_method` is called.

Upon the method invocation of `some_method`, the local variable `a` is initialized to the Integer `1`.

On line 3, the `times` method is called on the Integer `5` with the `do...end` on lines 3 to 6 passed in as an argument. The method invocation of `times` alongside the `do...end` defines a block and hence creates an inner scope.

Inside the block, on line 4, the `puts` method is called with an argument `a`. As `a` was initialized outside of the block on line 2, it is accessible inside the block, hence outputting `1` to the console **(for 5 times)**. On line 5, within the block, the local variable `b` is initialized to `2` **(and re-assigned to the same Integer for the subsequent iterations)**.

Outside the block on lines 8 and 9, while the local variable `a` is in scope, `b` is not. It is because `b` was initialized inside the block, it is not accessible outside the block.

Hence, on line 8, it outputs `1` to the console, and on line 9, it throws a `NameError`.

This code demonstrates the local variable scoping rules in Ruby: local variables initialized outside of a block is accessible inside the block, but not vice versa.

21:09

### Note for #2

- I was going too fast that I missed the fact that `puts a` on line 4 outputs `1` to the console for 5 times.

## 3

````ruby
a = "Xyzzy"         # 1
                    # 2
def my_value(b)     # 3
  b[2] = '-'        # 4
end                 # 5
                    # 6
my_value(a)         # 7
puts a              # 8
````

On line 1, the local variable `a` is initialized to `"Xyzzy"`.

On line 7, the method `my_value` is called with an argument `a`. Upon the method invocation of `my_value`, the method parameter `b` is assigned to the String that `a` is referencing, which is `"Xyzzy"`. At this point, both `b` and `a` point to the same String `"Xyzzy"`. Then the character at position `2` of the String that `b` is referencing is re-assigned to `'-'`. As indexed assignment is a mutating operation, this change is also reflected on `a`.

Therefore, when the `puts` method is called with `a` as an argument on line 8, it outputs `Xy-zy` to the console.

21:12

## 4

````ruby
def amethod(param)         # 1
  param += " universe"     # 2
  param << " world"        # 3
end                        # 4
                           # 5
str = "hello"              # 6
amethod(str)               # 7
                           # 8
p(str)                     # 9
````

On line 6, the local variable `str` is initialized to the String `"hello"`.

on line 7, the method `amethod` is called with an argument `str`.

Upon the method invocation of `amethod`, the method parameter `param` is assigned to the String that `str` is referencing, which is `"hello"`. At this point, both `param` and `str` point to the same String `"hello"`. `param` is then re-assigned to a new String `"hello universe"`. As re-assignment break the link between the variable and the object it previously referenced, at this point, both `param` and `str` do not point to the same String anymore. `param` and `str` point to `"hello universe"` and `"hello"` respectively at this point. Therefore, there is no chance to mutate `str` again.

Therefore, when the `p` method is called with an argument `str` on line 9, it outputs `"hello"` to the console.

21:18

## 5

````ruby
def test(str)                       # 1
  str += '?'                        # 2
  str.downcase!                     # 3
end                                 # 4
                                    # 5
test_str = "Written Assessment"     # 6
test(test_str)                      # 7
                                    # 8
puts test_str                       # 9
````

On line 6, the local variable `test_str` is initialized to `"Written Assessment"`.

On line 7, the method `test` is called with an argument `test_str`.

Upon the method invocation of `test`, the method parameter `str` is assigned to the String that `test_str` is referencing, which is `"Written Assessment"`. At this point, both `str` and `test_str` point to the same String `"Written Assessment"`. `str` is then re-assigned to a new String `"Written Assessment?"`. As re-assignment break the link between the variable and the object it previously referenced, at this point, both `test_str` and `str` do not point to the same String anymore. `test_str` and `str` point to `"Written Assessment"` and `"Written Assessment?"` respectively at this point. Therefore, there is no chance to mutate `test_str` again.

Therefore, when the `puts` method is called with an argument `test_str` on line 9, it outputs `Written Assessment` to the console.

21:23

## 6

````ruby
def test                        # 1
  puts "written assessment"     # 2
end                             # 3
                                # 4
var = test                      # 5
                                # 6
if var                          # 7
  puts "written assessment"     # 8
else                            # 9
  puts "interview"              # 10
end                             # 11
````

The `test` on line 5 refer to the method definition on lines 1 to 3 here. Upon the method invocation of `test`, as `puts "written assessment"` is the last evaluated expression, its return value is the method's return value. Hence, the method invocation of `test` returns `nil`. `nil` is then assigned to the local variable `var` on line 5.

Considering the `if...end` statements on lines 7 to 11, as `var` is referencing `nil`, which is `falsy`, the `else` clause is executed, hence outputting `interview` to the console.

### Note for #6

- Re-Attempt

Upon the method invocation of `test`, the statement `puts "written assessment"` is run. It outputs `written assessmnet` to the console and returns `nil`. As the statement is the last evaluated expression of the method definition of `test`, it return value, which is `nil`, is also the method's return value. The return value `nil` is then assigned to the local variable `var` on line 5 where it is initialized.

When evaluating the **`if` statement**, `var` is pointing to `nil`, which is `falsy`. Therefore the **else clause** is executed, hence outputting `interview` to the console.

21:28

## 7

````ruby
animal = "dog"       # 1
                     # 2
loop do |animal|     # 3
  animal = "cat"     # 4
  break              # 5
end                  # 6
                     # 7
puts animal          # 8
````

On line 1, the local variable `animal` is initialized to the String `"dog"`.

On line 3, the `loop` method is called and passed in the `do...end` with a parameter `animal` on lines 3 to 6 as an argument. The method invocation of `loop` alongside the `do...end` defines a block and creates an inner scope within it.

As the name of the block parameter is the same as the local variable initialized on line 1, inside the block, the local variable `animal` initialized on line 1 is not accessible due to variable shadowing. Therefore, while `animal` is re-assigned to `"cat"` on line 4, the local variable initialized on line 1 is untouched.

Outside the block on line 8, the local variable `animal` initialized on line 1 is in scope. As it was untouched, line 8 outputs `dog` to the console.

This code demonstrates variable shadowing. It occurs when the name of the block parameter is the same as the local variable initialized outside of the box. In this case, the local variable is not accessible inside the block.

21:34

### Note for #7

- On line 4, the local variable `animal` is actually **re-assigned** to a new String `"cat"`. This can be shown by the following code:

````ruby
animal = "dog"

loop do |animal|
  p animal # => nil
  animal = "cat" # was nil, reassigned to "cat"
  break
end

puts animal
````

## 8

````ruby
animal = "dog"       # 1
                     # 2
loop do |animal|     # 3
  animal = "cat"     # 4
  var = "ball"       # 5
  break              # 6
end                  # 7
                     # 8
puts animal          # 9
puts var             # 10
````

On line 1, the local variable `animal` is initialized to the String `"dog"`.

On line 3, the `loop` method is called and passed in the `do...end` with a parameter `animal` on lines 3 to 7 as an argument. The method invocation of `loop` alongside the `do...end` defines a block and creates an inner scope within it.

As the name of the block parameter is the same as the local variable initialized on line 1, inside the block, the local variable `animal` initialized on line 1 is not accessible due to variable shadowing. Therefore, while `animal` is re-assigned to `"cat"` on line 4, the local variable initialized on line 1 is untouched.

Inside the block on line 5, the local variable `var` is initialized to `"ball"`.

Outside the block on line 9, the local variable `animal` initialized on line 1 is in scope. As it was untouched, line 9 outputs `dog` to the console.

Outside the block on line 10, the local variable `var` is not in scope. It is because `var` was initialized inside the block, it is not accessible outside the block. Hence, line 10 throws a `NameError`.

This code demonstrates the local variable scoping rules in Ruby: local variables initialized outside of a block is accessible inside the block, but not vice versa. However, if the name of a block parameter is the same as the local variable initialized outside the block, the local variable initialized outside the block is not accessible inside the block. That is what the code also demonstrates: variable shadowing.

21:41

## 9***

````ruby
MY_TEAM = "Los Angeles Clippers"     # 1
                                     # 2
loop do                              # 3
  MY_TEAM = "Phoenix Suns"           # 4
  break                              # 5
end                                  # 6
                                     # 7
while true                           # 8
  MY_TEAM = "Los Angeles Lakers"     # 9
  break                              # 10
end                                  # 11
                                     # 12
def best_team                        # 13
  MY_TEAM = "Utah Jazz"              # 14
end                                  # 15
                                     # 16
puts MY_TEAM                         # 17
````

On line 1, the constant `MY_TEAM` is initialized to `"Los Angeles Clippers"`.

On line 4, the constant `MY_TEAM` is *trying* to re-assigned to `"Phoenix Suns"`, which is not allowed in Ruby. Ruby will give a warning.

The same situation on line 9.

On lines 13 to 15, within the method definition. Ruby does not allow constant initialization inside a method defition. Ruby will also give a warning here.

On line 17, it does not output anything to the console due to the above warning. It just won't get to that line.

21:52

### Note for #9

- This one tripped me up.

- Constants aren't suppose to be re-assigned. Although Ruby lets you do that, it gives you a warning.

- Constants can only be defined **outside** of method definitions.

- Re-Attempt

On line 1, the constant `MY_TEAM` is initialized to `"Los Angeles Clippers"`.

On line 4, `MY_TEAM` is re-assigned to `"Phoenix Suns"`. Although constants are not supposed to be re-assigned, Ruby lets you do it but gives you a warning message. Also, the re-assignment is possible here within the block because constants have a global scope.

The same situation on line 9. Here `MY_TEAM` is re-assigned to `"Los Angeles Lakers"`.

On line 14, it tries to **initialize** a constant `MY_TEAM` inside the method definition of best_team`. However, this is not allowed by Ruby, giving you an error message.

The above code will not get to line 17.

## 10

````ruby
array = [1,2,3,4,5,6,7,8,9,10]     # 1
                                   # 2
odds = array.select do |n|         # 3
         n+1                       # 4
       end                         # 5
                                   # 6
p  odds                            # 7
                                   # 8
incremented = array.map do |n|     # 9
                n.odd?             # 10
              end                  # 11
                                   # 12
p incremented                      # 13
                                   # 14
incremented = array.map do |n|     # 15
                n.odd?             # 16
                puts n             # 17
              end                  # 18
                                   # 19
p incremented                      # 20
````

On line 1, the local variable `array` is initialized to the Array `[1,2,3,4,5,6,7,8,9,10]`.

On line 3, the `select` method is called on the Array that `array` is referencing (which is `[1,2,3,4,5,6,7,8,9,10]`) with the `do...end` block on lines 3 to 5 as an argument. The `select` method selects elements in the calling Array based on the truthiness of the return value of the block. In this case, the block's return value of each element in the Array is the element itself plus `1`, which is always `truthy`. Therefore, all elements in **the calling Array** are selected. The `select` method returns a new Array `[1,2,3,4,5,6,7,8,9,10]`, which is then assigned to `odds` **where it is initialized**.

Therefore, on line 7, it outputs `[1,2,3,4,5,6,7,8,9,10]` to the console.

On line 9, the `map` method is called on the Array that `array` is referencing (which is `[1,2,3,4,5,6,7,8,9,10]`) with the `do...end` block on lines 9 to 11 as an argument. The `map` method transforms elements in the calling Array based on the return value of the block. In this case, the block's return value for elements that are odd is `true`, and that for elements that are even is `false`. Therefore, the `map` method returns a new Array `[true, false, true, false, true, false, true, false, true, false]`, which is then assigned to `incremented` **where it is initialized**.

Therefore, on line 13, it outputs `[true, false, true, false, true, false, true, false, true, false]` to the console.

On line 15, the `map` method is called on the Array that `array` is referencing (which is `[1,2,3,4,5,6,7,8,9,10]`) with the `do...end` block on lines 15 to 18 as an argument. The `map` method transforms elements in the calling Array based on the return value of the block. In this case, **as the last evaluated expression of the block is `puts n`**, the block's return value for all elements is `nil`. Therefore, the `map` method returns a new Array `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`, which is then assigned to `incremented`.

Therefore, on line 20, it outputs `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]` to the console.

22:03

## 11***

````ruby
a = 7               # 1
                    # 2
def my_value(a)     # 3
  a += 10           # 4
end                 # 5
                    # 6
my_value(a)         # 7
puts a              # 8
````

On line 7, the method `my_value` is called and passed in the local variable `a`, which points to the Integer `7`.

Upon the method invocation of `my_value`, `a` is then re-assigned to `17`, which the return value of `my_value`. However, the return value is not assigned to any variables.

As re-assignment does not mutate a variable, the local variable `a` initialized on line 1 remains unchanged.

Therefore, when the `puts` method is called with an argument `a`, it outputs `7` to the console.

### Note for #11

- Re-Attempt

As method definition has a self-contained scope **with respect to local variables**, the local variable `a` initialized on line 1 is not accessible inside the method definition, and that inside the method defintion is not accessible outside of it.

Therefore, when the `puts` method is called with an argument `a` on line 8, the local variable `a` initialized on line 1 is in scope, hence outputting `7` to the console.

## 12***

````ruby
a = 7               # 1
                    # 2
def my_value(b)     # 3
  a = b             # 4
end                 # 5
                    # 6
my_value(a + 5)     # 7
puts a              # 8
````

On line 1, the local variable `a` is initialized to `7`.

Upon the method invocation of `my_value` and passed in `a + 5` (which is calculated to be `12`) as an argument, `a` initialized inside the method definition on line 4 is initialized to `12`.

As method definition has a self-contained scope, the local variable `a` inside the method definition `my_value` is not accessible on line 8.

Outside the method definition, the local variable `a` initialized on line 1 is in scope, hence outputting `7` to the console.

22:14

### Note for #12

- Re-Attempt

As method definition has a self-contained scope **with respect to local variables**, the local variable `a` initialized on line 1 is not accessible inside the method definition, and that inside the method definition is not accessible outside of it.

Therefore, when the `puts` method is called with an argument `a` on line 8, the local variable `a` initialized on line 1 is in scope, hence outputting `7` to the console.

- Additional Practice

````ruby
a = 7               # 1
                    # 2
def my_value(b)     # 3
  b += 10           # 4
end                 # 5
                    # 6
my_value(a)         # 7
puts a              # 8
````

On line 7, the method `my_value` is called with an argument `a`.

Upon the method invocation of `my_value`, the method parameter `b` is assigned to the object that `a` is referencing, which is the Integer `7`. At this point, both `a` and `b` point to the same Integer `7`. `b` is then re-assigned to a new Integer `17`. As re-assignment breaks the link between the variable and the object it previously referenced, at this point, `a` and `b` point to `7` and `17` respectively.

Therefore, when the `puts` method is called with an argument `a`, it outputs `7` to the console.

## 13

````ruby
a = "Xyzzy"         # 1
                    # 2
def my_value(b)     # 3
  b = 'yzzyX'       # 4
end                 # 5
                    # 6
my_value(a)         # 7
puts a              # 8
````

On line 1, the local variable `a` is initialized to `"Xyzzy"`.

Upon the method invocation of `my_value` with an argument `a`, the method parameter `b` is assigned to the String that `a` is referencing, which is `"Xyzzy"`. At this point, both `a` and `b` point to the same String `"Xyzzy"`.  `b` is then re-assigned to a new String `'yzzyX'`. As re-assignment breaks the link the variable and the object it previously referenced, `a` is untouched.

Therefore, on line 8, it outputs `Xyzzy` to the console.

22:18

## 14

````ruby
a = 7                       # 1
array = [1, 2, 3]           # 2
                            # 3
array.each do |element|     # 4
  a = element               # 5
end                         # 6
                            # 7
puts a                      # 8
````

On line 1, the local variable `a` is initialized to `7`.

On line 2, the local variable `array` is initialized to `[1, 2, 3]`.

On line 4, the method `each` is called on the Array that `array` is referencing, which is `[1, 2, 3]`, with the `do...end` on lines 4 to 6 as an argument. The method invocation of `each` alongside the `do...end` defines a block and creates an inner scope.

The `each` method iterate through the array and execute the block for each element. For each element, it is assigned to the local variable `a`. The local variable `a` is in scope inside the block because it was initialized outside the block on line 1. After iteration, `a` will reference the last element of the Array that `array` is referencing, which is `3`.

Therefore, on line 8, it outputs `3` to the console.

22:22

## 15

````ruby
array = [1, 2, 3]           # 1
                            # 2
array.each do |element|     # 3
  a = element               # 4
end                         # 5
                            # 6
puts a                      # 7
````

On line 3, the method `each` is called on the object that `array` is referencing, which is the Array `[1, 2, 3]`, and passed in the `do...end` on lines 3 to 5 as an argument.

The method invocation of `each` alongside the `do...end` on lines 3 to 5 defines a block and creates an inner scope within it.

Inside the block, the local variable `a` is initialized.

Therefore, outside the block on line 7, `a` is not accessible, hence throwing a `NameError`.

This code demonstrate the variable scoping rule in Ruby; specifically the fact that local variable initialized inside a block is not accessible outside the block.

22:27

## 16

````ruby
a = 7                 # 1
array = [1, 2, 3]     # 2
                      # 3
array.each do |a|     # 4
  a += 1              # 5
end                   # 6
                      # 7
puts a                # 8
````

On line 1, the local variable `a` is initialized to the Integer `7`.

On line 2, the local variable `array` is initialized to the Array `[1, 2, 3]`.

On line 4, the method `each` is called on the object that `array` is referencing, which is the Array `[1, 2, 3]` and passed in the `do...end` block with a block parameter `a` on lines 4 to 6 as an argument.

Here, as the name of the block parameter is the same as the local variable initialized on line 1, the local variable `a` initialized on line 1 is not accessible inside the block due to variable shadowing.

Therefore, after the method invocation of the `each` method, the local variable `a` is untouched.

Therefore, on line 8, where the local variable `a` initialized on line 1 is in scope, it outputs `7` to the console.

This code demonstrates variable shadowing. It occurs when the name of the block parameter is the same as the local variable initialized outside of the box. In this case, the local variable is not accessible inside the block.

22:36

## 17***

````ruby
a = 7                 # 1
array = [1, 2, 3]     # 2
                      # 3
def my_value(ary)     # 4
  ary.each do |b|     # 5
    a += b            # 6
  end                 # 7
end                   # 8
                      # 9
my_value(array)       # 10
puts a                # 11
````

The above code throws `NoMethodError` due to the code on line 6 inside the method definition of `my_value`.

The statement on line 6 is `a += b`, which is equivalent to `a = a + b`.

Although `a` was initialized on line 1, it is not accessible inside the method definition of `my_value` because method definition has a self-contained scope. Variables used inside a method definition must either be passed into it or initialized in it.

Therefore, when the it attempts to re-assign `a` to `a + b` inside the method definition of `my_value`, `a` is not initialized (which defaults to `nil`), hence throwing `NoMethodError`.

22:43

## 18

````ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)             # 1
array2 = []                                                              # 2
array1.each { |value| array2 << value }                                  # 3
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }     # 4
puts array2                                                              # 5
````

On line 1, the local variable `array1` is initialized to the Array `["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]`.

On line 2, the local variable `array2` is initialized to an empty Array `[]`.

On line 3, the `each` method is called on the object that `array1` is referencing, which is `["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]`, and passed in the block as an argument. The `each` method iterates through the Array, assigns each element to the block parameter `value` and executes the block. For each iteration, each element is pushed to `array2`. As `Array#<<` is a mutating method, after iteration, `array2` is mutated to `["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]`.

At this point, although both `array1` and `array2` point to two different Array objects, the elements at the same position in both Arrays are shared.

On line 4, the `each` method is again called on `["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]`. This time, all elements that start with `'C'` or `'S'` are capitalized in-place (because `upcase!` is a mutating method). Therefore on line 4, it returns the same but mutated Array `["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]`.

As elements at the same position in both Arrays that `array1` and `array2` are referencing are shared and `upcase!` is a mutating method, this change is also reflected on `array2`.

Therefore, when the `puts` method is called on line 5 with an argument `array2`, it outputs the following to the console:

````ruby
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
````

22:56

## 19

````ruby
def test(b)                                           # 1
  b.map {|letter| "I like the letter: #{letter}"}     # 2
end                                                   # 3
                                                      # 4
a = ['a', 'b', 'c']                                   # 5
test(a)                                               # 6
````

On line 5, the local variable `a` is initialized to the Array `['a', 'b', 'c']`.

On line 6, the method `test` is called with an argument `a`.

Upon the method invocation of `test`, the method parameter `b` is assigned to the object that `a` is referencing, which is `['a', 'b', 'c']`.

The `map` method is then called on `b` and passed in the block `{|letter| "I like the letter: #{letter}"}` as an argument. The `map` method transforms each element based on the return value of the block. In this case, the block's return for each element is `"I like the letter: #{letter}"`. Therefore, the `map` method will returns a new Array `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. As line 2 is the last evaluated expression of the method definition, `["I like the letter: a", "I like the letter: b", "I like the letter: c"]` is also the return value of the method.

As the return object does not passed to any of the `p`, `puts` or `print` methods, nothing is output to the console.

23:05

## 20

````ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|     # 1
  arr.select do |item|                                            # 2
    if item.to_s.to_i == item    # if it's an integer             # 3
      item > 13                                                   # 4
    else                                                          # 5
      item.size < 6                                               # 6
    end                                                           # 7
  end                                                             # 8
end                                                               # 9
````

On line 1, the method `map` is called on the two-dimensional array `[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]` and passed in the block on lines 1 to 9. Upon the method invocation of `map`, each sub-array is assigned to the block parameter `arr` and executes the block. The `map` method transforms each element (which is each sub-array) based on the return value of the block.

Inside the block that is passed to the `map` method, the `select` method is called on each sub-array and passed in the block on lines 2 to 8. The `select` method selects elements (which are the elements of each sub-array) based on the truthiness of the return value of the block.

Consider the first sub-array `[8, 13, 27]`, as each element is an integer, the if-clause (`item > 13`) is executed. In this case, the block that is passed to the `select` method returns `true` for elements that are greater than `13`. Therefore, only the element `27` is selected, and thus the `select` method returns a new Array `[27]`.

Consider the second sub-array `['apple', 'banana', 'cantaloupe']`, as each element is not an integer, the else-clause (`item.size < 6`) is executed. In this case, the block that is passed to the `select` method returns `true` for elements that have a length of smaller than `6`. Therefore, only the element `'apple'` is selected, and the `select` method returns a new Array `['apple']`.

As the method invocation of `select` on the object that `arr` references (each sub-array) is the last evaluated expression of the block that is passed to the `map` method, the return value of the `select` method is the return value of the block that is passed to the `map` method.

So, the return value of the block that is passed to the `map` method for the sub-arrays (the elements of the two-dimensional array) `[8, 13, 27]` and `['apple', 'banana', 'cantaloupe']` are respectively `[27]` and `['apple']`.

As the `map` method transforms each sub-array based on the return value of the block, it returns a new Array object `[[27], ["apple"]]`

23:22

## 21

````ruby
[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|     # 1
  sub_arr.map do |letter|                                 # 2
    letter.upcase                                         # 3
  end                                                     # 4
end                                                       # 5
````

On line 1, the `map` method is called on the Array object `[['a', 'b'], ['c', 'd'], ['e', 'f']]` and passed in the `do...end` block on lines 1 to 5 as an argument.

Upon the invocation of `map` on line 1, each sub-array is assigned to the block parameter `sub_arr` and executes the block.

The `map` is then called on each sub-array on line 2 and passed in the `do...end` block on lines 2 to 4 as an argument.

Upon the invocation of `map` on line 2, each element of the sub-array is assigned to the block parameter `letter` and executes the block.

The `map` method transforms elements of an Array based on the return value of the block.

Consider the method invocation of `map` on line 2, for each element (each letter) in the sub-array, the block's return value is the letter upper-cased. Therefore, for each sub-array, the `map` method will return a new Array with all letter upper-cased.

As the method invocation of `map` on the object that `sub_arr` references (each sub-array) is the last evaluated expression of the block that is passed to the `map` method on line 1, the return value (all letters in all sub-arrays upper-cased) is the return value of the outer block.

Consider the method invocation of `map` on line 1, for each sub-array, the block's return is a sub-array with all letters upper-cased. Therefore, the `map` method invoked on line 1 returns a new Array `[['A', 'B'], ['C', 'D'], ['E', 'F']]`.

23:35

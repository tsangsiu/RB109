# Practice Problems

## Local Variable Scope

### 1

What does the followig code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = "Hello"       # 1
b = a             # 2
a = "Goodbye"     # 3
puts a            # 4
puts b            # 5
````

The above code outputs `Goodbye` and `Hello` to the console, and returns `nil` and `nil`.

On line 1, the local variable `a` is initialized and assigned to the String `"Hello"`.

On line 2, the local variable `b` is initialized and assigned to the object refernced by `a`, which is `"Hello"`.

On line 3, the local variable `a` is re-assigned to another String `"Goodbye"`.

Therefore, on line 4, when the `puts` method is called and passed in `a` as an argument, `Goodbye` is outputted to the console and returns `nil`. For line 5, `Hello` is outputted to the console and returns `nil`.

This code demonstrates how variables behave as *pointers to objects* in Ruby, and are not deeply linked to each other, even when one is assigned to the other. It also demonstrates that assignment creates a new object in memory, and breaks the link between the variable and the object it previously referenced.

### 2

What does the followig code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = 4     # 1
          # 2
loop do   # 3
  a = 5   # 4
  b = 3   # 5
  break   # 6
end       # 7
          # 8
puts a    # 9
puts b    # 10
````

The above above outputs `5`, returns `nil` and raises an error: undefined local variable or method `b`.

On line 1, the local variable `a` is initalized and assigned to the Integer `4`.

On lines 3 to 7, the `do...end` alongside the `loop` method invocation defines a block and establishes an inner scope in the block. Within the block, `a` is reassigned to a new Integer `5` and the local variable `b` is initialized and assigned to the Integer `3`.

On line 9, the `puts` method is called with the variable `a` passed to it as an argument. As `a` now points to the Integer `5`, this line outputs `5` and return `nil`.

On line 10, the `puts` method is called with the variable `b` passed to it as an argument. As `b` is initialized inside the `do...end` block on lines 3 to 7, it is not accessible outside the block, hence this line raises an error: undefined local variable or method `b`.

This code demonstrate the local variable scoping rules in Ruby: local variables initialized outside of a block is accessible inside the block, but local variables initialized inside of a block is not accessible outside of the block.

### 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = 4     # 1
b = 2     # 2
          # 3
loop do   # 4
  c = 3   # 5
  a = c   # 6
  break   # 7
end       # 8
          # 9
puts a    # 10
puts b    # 11
````

The above code outputs `3`, returns `nil`, outputs `2` and returns `nil`.

On lines 1 to 2, the local variables `a` and `b` are initialized and assigned to the Integers `4` and `2` respectively.

On lines 4 to 8, the `do...end` alongside the `loop` method invocation defines a block and establishes an inner scope. Within the block, the local variable `c` is initialized and assigned to the Integer `3`, and `a` is reassigned to the object that `c` is referencing, which is the Integer `3`. As `a` and `c` are in the same scope within the `do...end` block, `c` is accessible to `a`.

On lines 10 to 11, the `puts` methods are called with variables `a` and `b` passed to them as arguments respectively. As `a` and `b` now points to `3` and `2` repspectively, lines 10 and 11 output `3` and `2` respectively and both lines return `nil`.

This code demonstrate the local variable scoping rules in Ruby: local variables initialized outside of a block is accessible inside of the block, but local variables initialized inside of a block is not accessible outside of the block.

### 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def example(str)      # 1
  i = 3               # 2
  loop do             # 3
    puts str          # 4
    i -= 1            # 5
    break if i == 0   # 6
  end                 # 7
end                   # 8
                      # 9
example('hello')      # 10
````

The above code outputs `'hello'` three times and returns `nil`.

On line 10, the method `example` is called with the String `'hello'` pass to it as an argument.

Upon the method invocation of `example`, the method parameter `str` is assigned to the String `'hello'`. Inside the method definition, as defined on lines 1 to 8, the local variable `i` is initialized and assigned to the Integer `3` on line 2. The `do...end` alongside the `loop` method invocation on lines 3 to 7 defines a block, within with the `puts` method is called with variable `str` passed to it as an argument, hencing outputting `'hello'`. The local variable `i` is then reassigned to `i - 1`, which is now `2`. The `do...end` block is executed two more times until `i` reaches `0`. This is why the above code outputs `'hello'` three times. As the last statement in the method definition is `break if i == 0`, the method returns `nil`.

The above code demonstrate method definiton and invocation. The method `example` is defined with an **parameter** `str` on lines 1 to 8, and it is called on line 10 with an **argument** `'hello'` passed to it.

### 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def greetings(str)   # 1
  puts str           # 2
  puts "Goodbye"     # 3
end                  # 4
                     # 5
word = "Hello"       # 6
                     # 7
greetings(word)      # 8
````

The above code outputs `"Hello"` and `"Goodbye"`, and returns `nil`.

On line 8, the method `greetings` is called with the variable `word` passed to it as an argument.

Upon the method invocation of `greetings` with the arguement `word`, the method paramter `str` is assigned to the object that `word` is referencing, which is the String `"Hello"`. Inside the method defintion, as defined on lines 1 to 4, the `puts` methods are called with arguments `str` and `"Goodbye"` passed to them on lines 2 and 3 respectively, hence outputting `"Hello"` and `"Goodbye"`. As the last evaluated statement in the method defintion is `puts "Goodbye"`, the method returns `nil`.

This code demonstrates method defintion and invocation. The method `greetings` is defined with a method **parameter** `str` on lines 1 to 4, and it is called on line 8 with an **argument** `word`. This also demonstrates how local variables defined outside of a method definiton are made available inside of it by passing them into a method as arguements.

### 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4]                 # 1
counter = 0                        # 2
sum = 0                            # 3
                                   # 4
loop do                            # 5
  sum += arr[counter]              # 6
  counter += 1                     # 7
  break if counter == arr.size     # 8
end                                # 9
                                   # 10
puts "Your total is #{sum}"        # 11
````

The above code outputs `You total is 10` to the console and returns `nil`.

On line 1, the local variables `arr` is initialized and assigned to the Array object `[1, 2 ,3 ,4]`.

On lines 2 and 3, the local variables `counter` and `sum` are initialized and assigned to the Integer `0`.

On line 5, the `loop` method is called with the `do...end` on lines 5 to 9 passed in as an argument. The method invocation of `loop` alongside the `do...end` defines a block and creates an inner scope within it. For each iteration, the local variable `sum` is incremented by each element in `arr` by using `counter` to keep track of the elements. As both `counter` and `sum` are initialized outside the block, they are accessible and therefore can be manipulated within the block. After adding the last element in `arr` to `sum`, we get out of the loop.

On line 11, the `puts` method is called with `"Your total is #{sum}"` passed in as an argument. As `sum` now points to `10`, line 11 outputs `You total is 10` to the console and returns `nil`.

This code demonstrates the local variable scoping rules in Ruby; specifically the fact that local variables initialized outside a block are accessible within the block.

### 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = 'Bob'          # 1
                   # 2
5.times do |x|     # 3
  a = 'Bill'       # 4
end                # 5
                   # 6
p a                # 7
````

The above code outputs `"Bill"` to the console and returns `"Bill"`.

On line 1, the local variable `a` is initialized and assigned to the String `'Bob'`.

On line 3, the `times` method is called on the Integer `5` and passed in the `do...end` on lines 3 to 5 as an argument. The method invocation of `times` alongside the `do...end` defines a block and creates an inner scope within it. As `a` was initialized outside the block, it is accessible inside the block. Inside the block, `a` is re-assigned to String `'Bill'` (for 5 times).

On line 7, the `p` method is called with `a` as an arguement. As `a` now points to the String `'Bill'`, line 7 outputs `"Bill"` to the console and returns `"Bill"`.

This code demonstrates the local variable scoping rules in Ruby; specifically the fact that local variables initialized outside a block is accessible inside the block.

### 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
animal = "dog"       # 1
                     # 2
loop do |_|          # 3
  animal = "cat"     # 4
  var = "ball"       # 5
  break              # 6
end                  # 7
                     # 8
puts animal          # 9
puts var             # 10
````

The above code returns `nil`, outputs `cat` to the console and throws a NameError.

On line 1, the local variable `animal` is initialized and assigned to the String `"dog"`.

On line 3, the `loop` method is called and passed in the `do...end` on lines 3 to 7 as an argument. The method invocation of `loop` alongside the `do...end` defines a block and hence creates an inner scope within it. As `animal` was initialized outside the block, it is accessible within the block. On line 4, `animal` is re-assigned to the String `"cat"`. On line 5, the local variable `var` is initialized and assigned to the String `"ball"`.

On line 9, the `puts` method is called with `animal` as an argument. As `animal` now points to the String `"cat"`, line 9 outputs `cat` to the console and returns `nil`.

On line 10, the `puts` method is called with `var` as an argument. As `puts` was initialized inside the block on lines 3 to 7, it is not accessible outside the block. Hence, line 10 throws a NameError.

This code demonstrates the local variable scoping rules in Ruby: local variables initialized outside a block is accessible inside the block, but those initialized inside a block is not accessible outside the block.

## Variable Shadowing

### 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = 4              # 1
b = 2              # 2
                   # 3
2.times do |a|     # 4
  a = 5            # 5
  puts a           # 6
end                # 7
                   # 8
puts a             # 9
puts b             # 10
````

The above code outpus `5`, `5`, `4` and `2` to the console.

On lines 1 and 2, the local variables `a` and `b` are initialized and assigned to the Integers `4` and `2` respectively.

On line 4, the `times` method is called on the Integer `2` and passed in the `do...end` on lines 4 to 7 as an argument. The method invocation of `times` alongside the `do...end` defines a block and hence creates an inner scope within the block.

The name of the block parameter is `a`, which is the same as the local variable initalized outside the block on line 1. In this case, the block parameter `a` "shadows" the local variable `a`. The local variable `a` is not accessible within the block. On line 5, `5` is assigned to the local variable `a` passed in as a block parameter. Therefore, when the `puts` method is called on line 6 and passed in `a` as an argument, `5` is outputted to the console (and returns `nil`) twice .

On line 9, the `puts` method is called and passed in `a` as an argument. Here, the local variable `a` passed in as a block parameter is out of scope and thus references `4`, hence outputting `4` to the console and returning `nil`.

On line 10, the `puts` method is called and passed in `b` as an argument, hence outputting `2` to the console and returning `nil`.

This code demonstrates the concept of variable shadowing. When the name of a block parameter is the same as a local variable that was initialized outside the block, the block parameter "shadows" the local variable of the same name. The local variable is not accessible within the block.

### 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
n = 10             # 1
                   # 2
1.times do |n|     # 3
  n = 11           # 4
end                # 5
                   # 6
puts n             # 7
````

The above code outputs `10` to the console and returns `nil`.

On line 1, the local variable `n` is initialized and assigned to the Integer `10`.

On line 3, the `times` method is called on the Integer `1` and passed in the `do...end` on lines 3 to 5 with a parameter `n` as an arguement. The method invocation of `times` alongside the `do...end` defines a block and hence creates an inner scope within it.

As the name of the block parameter is the same as that of the local variable initialized on line 1, the local variable `n` inside the block "shadows" the one initalized outside the block. The local variable `n` initialized on line 1 is not accessible within the block. Hence when `11` is assigned to `n` passed in as a block parameter on line 4, the local variable `n` initialized on line 1 still points to the Integer `10`.

So, when the `puts` method is called with `n` as an argument on line 7, `10` is outputted to the screen and returns `nil`.

This code demonstrates the concept of variable shadowing. When the name of a block parameter is the same as a local variable initialized outside of the block. The block parameter "shadows" the local variable of the same name. The local variable is not accessible within the block.

### 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

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

The above code outputs `dog` to the console and returns `nil`.

On line 1, the local variable `animal` is initialized and assigned to the String `"dog"`.

On line 3, the `loop` method is called and passed in the `do...end` on lines 3 to 6 as an argument with a paramter `animal`. As the name of the block parameter is the same as that of the local variable initialized on line 1, the local variable `animal` in the block "shadows" the one outside the block of the same name. The one of the same name outside the block is not accessible inside the block. Therefore, when `"cat"` is assigned to the local variable `animal` passed in as a block parameter, the local variable `animal` that was initialized outside the block still points to `"dog"`.

Therefore, when the `puts` method is called with an argument `animal`, `dog` is outputted to the screen and returns `nil`.

This code demonstrate the concept of variable shadowing. When the name of the block parameter is the same as a local variable that was initialized outside the block. The block parameter "shadows" the local variable of the same name. The one outside the block is not accessible inside the block.

## Object Passing/Variables as Pointers

### 12

What are `a` and `b`? Why? What concept does it demonstrate?

````ruby
a = "hi there"      # 1
b = a               # 2
a = "not there"     # 3
````

The local variables `a` and `b` respectively reference the String objects `"not there"` and `"hi there"`.

On line 1, the local variable `a` is initialized and assigned to the String object `"hi there"`.

On line 2, the local variable `b` is initialized and assigned to the object that `a` is referencing, which is `"hi there"`.

On line 3, the local variable `a` is re-assigned to another String object `"not there"`.

This code demonstrates how variables behave as pointers to objects in Ruby, and they are not deeply linked to each other, even when one is assigned to the other. It also demonstrates that re-assignment to a new object creates a new object in memory, and that breaks the link between the local variable and the object it previously referenced.

### 13

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = "hi there"     # 1
b = a              # 2
a << ", Bob"       # 3
````

After the above code is executed, both the local variables `a` and `b` reference the same String object `"hi there, Bob"`.

On line 1, the local variable `a` is initialized and assigned to the String object `"hi there"`.

On line 2, the local variable `b` is initialized and assigned to the object the `a` is referencing, which is `"hi there"`.

On line 3, the object that `a` references is appended with the String `", Bob"`. As `String#<<` is a destructive method, it modifies the String object that `a` references in place to `"hi there, Bob"`. As `b` references the same String object as `a`, this change also reflects in the local variable `b`. Therefore, both `a` and `b` now refernce `"hi there, Bob"`.

This code demonstrates the fact that variables act as pointers to objects.

### 14

What are `a`, `b`, and `c`? What if the last line was `c = a.uniq!`?

````ruby
a = [1, 2, 3, 3]     # 1
b = a                # 2
c = a.uniq           # 3
````

The local variables `a`, `b` and `c` are respectively `[1, 2, 3, 3]`, `[1, 2, 3, 3]` and `[1, 2, 3]`.

If the last line was `c = a.uniq!`, `a`, `b` and `c` would be all `[1, 2, 3]`.

On line 1, the local variable `a` is initalized and assigned to the Array object `[1, 2, 3, 3]`.

On line 2, the local variable `b` is initalized and assigned to the object that `a` is referencing, which is `[1, 2, 3, 3]`.

On line 3, the local variable `c` is initialized and assigned to the return value of `a.uniq`. As `Array#uniq` is a non-mutating method, it returns a new Array object `[1, 2, 3]`. Therefore, `c` now references `[1, 2, 3]`, and both `a` and `b` are unaffected, referencing the same Array object `[1, 2, 3, 3]`.

If the last line was `c = a.uniq!`, `a.uniq!` would not return a new Array object as `Array#uniq!` is a mutating method. Instead, it modifies the calling object in place. Therefore, `a` is modified in place to `[1, 2, 3]` and assigned to `c`. As `b` references the same Array object as `a`, the change would also reflect in `b`. Therefore `a`, `b` and `c` all reference the same Array object `[1, 2, 3]` at this point.

This code demonstrates that variables act as pointers to objects in Ruby.

### 15

What is `a`? What if we called `map!` instead of `map`?

````ruby
def test(b)                                             # 1
  b.map { |letter| "I like the letter: #{letter}" }     # 2
end                                                     # 3
                                                        # 4
a = ['a', 'b', 'c']                                     # 5
test(a)                                                 # 6
````

After execution of the above code, a is `['a', 'b', 'c']`. If we called `map!` instead of `map`, `a` would be `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`.

On line 5, the local variable `a` is initalized and assigned to the Array object `['a', 'b', 'c']`.

On line 6, the method `test` is called and passed in `a` as an argument. Upon method invocation, the method parameter `b` is assigned to the object that `a` is referencing, which is `['a', 'b', 'c']`. The `map` method is then called on `b` and passed in the block `{ |letter| "I like the letter: #{letter}" }` as an argument. For each iteration, each element in `b` is assigned to the block parameter `letter` and run through the block. The `map` method will return a *new* transformed array with each element being the block's return value for the corresponding element. For each element in `b`, the block's return value is the return value of the block's last evaluated expression, which is `"I like the letter: #{letter}"`. Therefore, the `map` method returns `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`, and `a` is unaffected. The return array happens to be the method's return value because `b.map { |letter| "I like the letter: #{letter}" }` is the last evaluated expression of the `test` method. Therefore, line 6 returns `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`, and `a` remains to be `['a', 'b', 'c']`.

If the `map!` method is called instead of `map`, the `map!` would not return a new transformed array. Instead, it modifies the calling Array object in place. Therefore, when the local variable `a` and the method parameter `b` both reference the same Array object `['a', 'b', 'c']` upon method invocation, and the method `map!` is called on `b`, the `map!` method modifies `b` in place, and thus the change would also reflect in `a`. Hence, both `a` and `b` would reference the same Array object `["I like the letter: a", "I like the letter: b", "I like the letter: c"]` at the end.

This code demonstrates how objects are passed in Ruby: they are passed by reference, instead of passing by value.

### 16

What are `a` and `b`? Why?

````ruby
a = 5.2      # 1
b = 7.3      # 2
             # 3
a = b        # 4
b += 1.1     # 5
````

After execution of the above code, `a` and `b` are respectively `7.3` and `8.4`.

On line 1, the local variable `a` is initialized and assigned to the Float object `5.2`.

On line 2, the local variable `b` is initialized and assigned to the Float object `7.3`.

On line 4, `a` is re-assigned to the Float object that `b` is referencing, which is `7.3`.

On line 5, `b` is re-assigned to another Float object `b + 1.1`, which is calculated to be `8.4`. As Floats are immutable, the Float object that `b` references does not mutated. Instead, `b` points to a new Float object `8.4`. Therefore `a` is unaffected and remains to be `5.2`.

### 17

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def test(str)                       # 1
  str += '!'                        # 2
  str.downcase!                     # 3
end                                 # 4
                                    # 5
test_str = 'Written Assessment'     # 6
test(test_str)                      # 7
                                    # 8
puts test_str                       # 9
````

The last line outputs `Written Assessment` to the console and returns `nil`.

On line 6, the local variable `test_str` is initialized and assigned to the String `'Written Assessment'`. It is then passed in to the method `test` as an argument. Upon the method invocation of `test`, the method parameter `str` is assigned to the String that `test_str` is referencing, which is `'Written Assesssment'`. `str` is then re-assigned to a *new* String `'Written Assessment!'`. At this point, `str` and `test_str` are referencing two different Strings, where `test_str` is still pointing to the String `Written Assessment`. Therefore, when the `puts` method is called on line 9 and passed in `test_str` as an argument, it outputs `Written Assessment` to the screen and returns `nil`.

This code demostrates how variables in Ruby behave as pointers to objects, and that re-assignment breaks the link between the variable and the object it previously referenced.

### 18

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def plus(x, y)     # 1
  x = x + y        # 2
end                # 3
                   # 4
a = 3              # 5
b = plus(a, 2)     # 6
                   # 7
puts a             # 8
puts b             # 9
````

The lines 8 and 9 output `3` and `5` to the console and both return `nil`.

On line 5, the local variable `a` is initialized and assigned to the Integer `3`.

On line 6, the local variable `b` is initialized and assigned to the return value of `plus(a, 2)`.

Upon the method invocation of `plus` with two arguments `a` and `2`, the method parameters `x` and `y` are respectively assigned to `a` (which points to `3`) and `2`. Then, `x` is re-assigned to the return value of `x + y`, which is `5`. As `x = x + y` is the last evaluated expression of the method `plus`, the return value of it (which is `5`) is also the return value of the method. Therefore `b` is initialized and assigned to `5` on line 6.

Therefore, when the `puts` method is called and passed in `a` and `b` respectively on lines 8 and 9, they output `3` and `5` to the console, and both return `nil`.

### 19

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def increment(x)     # 1
  x << 'b'           # 2
end                  # 3
                     # 4
y = 'a'              # 5
increment(y)         # 6
                     # 7
puts y               # 8
````

The line 8 outputs `ab` to the console and returns `nil`.

On line 5, the local variable `y` is initialized and assigned to the String `'a'`.

It is then passed in to the method `increment` as an argument. Upon the method invocation of `increment`, the method parameter `x` is assigned to the String that `y` is referencing, which is `'a'`. At this point, both `x` and `y` reference the same String `'a'`. `x` is then appended the String `'b'` destructively to `'ab'`. As `String#<<` is a mutating method, the change reflects in both `x` and `y`.

Therefore, when the method `puts` is called with an arguement `y` on line 8, it outputs `ab` to the console and returns `nil`.

This code demonstrates that variables behave as pointers to objects in Ruby, and thus when two variables points to the same object, any destructive change in the object will reflect in both variables, depsite the fact that method definition has a self-contained scope for local variables.

### 20

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def change_name(name)     # 1
  name = 'bob'            # 2
end                       # 3
                          # 4
name = 'jim'              # 5
change_name(name)         # 6
puts name                 # 7
````

The line 7 outputs `jim` to the console and returns `nil`.

On line 5, the local variable `name` is initialized and assigned to the String `'jim'`.

It is then passed in to the method `change_name` as an argument. Upon the method invocation of `change_name`, the method parameter `name` is assigned to the String that the local variable `name` is referencing, which is `jim`. Note that here the method parameter `name` and the local variable `name` in the main scope are two different variable, although they happen to reference the same String `jim` at this point. Inside the method definition, `name` is then re-assigned to a new String `'bob'`, while `name` in the main scope still points to `'jim'`.

Therefore, outside the method definition, when the `puts` method is called with an argument `name` on line 7, it outputs `'jim'` to the console and returns `nil`.

This code demonstrate that how variables in Ruby behave as pointers to objects, and that re-assignment breaks the link between the variable and the object it previously referenced.

### 21

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def cap(str)          # 1
  str.capitalize!     # 2
end                   # 3
                      # 4
name = 'jim'          # 5
cap(name)             # 6
puts name             # 7
````

The line 7 outputs `Jim` to the console and returns `nil`.

On line 5, the local variable `name` is initialized and assigned to the String `'jim'`.

It is then passed in to the method `cap` as an argument. Upon the method invocation of `cap`, the method parameter `str` is assigned to the String that `name` is referencing, which is `jim`. At this point, both `str` and `name` reference the same String `jim`. The `capitalize!` is then called on `str`. The String that `str` references, `'jim'` is modified in place to `'Jim'`. As `String#capitalize!` is a mutating method, the change reflects in both `str` and `name`.

Therefore, outside the method definition, when the `puts` method is called with an arguemnt `name` on line 7, it output `Jim` to the console and returns `nil`.

This code demonstrate that how variables in Ruby behave as pointers to objects, and that when two variables point to the same object and any destructive action is performed on the object, the change will reflect in both variables.

### 22

What is `arr`? Why? What concept does it demonstrate?

````ruby
a = [1, 3]       # 1
b = [2]          # 2
arr = [a, b]     # 3
arr              # 4
                 # 5
a[1] = 5         # 6
arr              # 7
````

On line 4, `arr` is referencing `[[1, 3], [2]]`, while on line 7, `arr` is referencing `[[1, 5], [2]]`.

On line 1, the local variable `a` is initialized and assigned to the Array `[1, 3]`.

On line 2, the local variable `b` is initialized and assigned to the Array `[2]`.

On line 3, the local variable `arr` is initialized and assigned to the Array object `[a, b]` (where `a` and `b` are the local variables initialized above), which is `[[1, 3], [2]]`.

Therefore, on line 4, `arr` is referencing `[[1, 3], [2]]`.

On line 6, the element at position `1` in the Array `a` is re-assigned to `5`. As one of the sub-arrays in `arr` also references `a`. This change not only reflects in `a`, but also in `arr`.

Therefore, on line 7, `arr` is referencing `[[1, 5], [2]]`.

This code demonstrate how variables behave as pointers to objects in Ruby, and that when a variable and an element of a collection object points to the same object and any destructive action is performed on the object, the change will reflect in both variable and the collection object.

### 23

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr1 = ["a", "b", "c"]     # 1
arr2 = arr1.dup            # 2
arr2.map! do |char|        # 3
  char.upcase              # 4
end                        # 5
                           # 6
puts arr1                  # 7
puts arr2                  # 8
````

While line 7 outputs `a`, `b` and `c` to the console, line 8 outputs `A`, `B` and `C` to the console. Both lines return `nil`.

On line 1, the local variable `arr1` is initialized and assigned to the Array object `["a", "b", "c"]`.

On line 2, the local variable `arr2` is initialized and assigned to the shallow copy of `arr1`. At this point, both `arr1` and `arr2` point to two different Array objects, although each corresponding element in both Arrays point to the same String objects.

On line 3, the `map!` method is called on `arr2` and passed in the `do...end` on lines 3 to 5 as an argument. For each iteration, each element in `arr2` is assigned to the block parameter `char` and run through the block. The `map!` method, which is a destructive method, modifies and transformed `arr2` in place based on the block's return value. In this case, each element in `arr2` is transformed to its upper case. As `upcase` is not a destrcutive method, such change to the elements of `arr2` does not affect those in in `arr1`. Therefore, `arr2` is mutated to `["A", "B", "C"]`, while `arr1` is unaffected.

Therefore, when the `puts` method is called on line 7 and passed in `arr1`, it outputs `a`, `b` and `c` to the console and returns `nil`. And on line 8, it outputs `A`, `B` and `B` to the console and returns `nil`.

This code demonstrates how you can mutate a shallow copy of a collection object without modifying the original object, as long as the mutating method is called on the shallow copy, rather than on its elements.

## Object Mutability/Mutating Methods

### 24

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def fix(value)          # 1
  value.upcase!         # 2
  value.concat('!')     # 3
  value                 # 4
end                     # 5
                        # 6
s = 'hello'             # 7
t = fix(s)              # 8
````

On line 7, the local variable `s` is initialized and assigned to the String `'hello'`.

on line 8, the method `fix` is called with an argument `s`. Upon the method invocation of `fix` with an argument `s`, the method parameter `value` is assigned to the String that `s` is referencing, which is `'hello'`. As this point, both `s` and `value` point to the same String object `'hello'`. As both `upcase!` and `concat` are mutating methods, `value` is then modified in place to `'HELLO'` and then `'HELLO!'`. As the `value` is mutated, so does `s`. As the last evaluated expression of the `fix` method is `value`, its return value is also the method's return value. Hence, on line 8, `fix(s)` returns `'HELLO!'`, and is assigned to the newly-initalized local variable `t`.

Therefore, after the execution of the above code, `s` and `t` both reference the same String object `'HELLO!'`.

This code demonstrates how objects in Ruby are passed around by reference, especially when both variables reference the same object, and some destructive methods are called on the object, the change is reflected on both variables.

### 25

What do `s` and `t` reference? Why?

````ruby
def fix(value)             # 1
  value = value.upcase     # 2
  value.concat('!')        # 3
end                        # 4
                           # 5
s = 'hello'                # 6
t = fix(s)                 # 7
````

After the execution of the above code, the local variables `s` and `t` reference `'hello'` and `'HELLO!'` respectively.

On line 6, the local variable `s` is initialized and assigned to the Strin `'hello'`.

On line 7, the `fix` method is called with an argument `s`. The method parameter `value` is then assigned to the object that `s` is referencing, which is `'hello'`. `value` is then re-assigned to a new String `'HELLO'`. As re-assignmnet break the link between variable and the object it previously referenced, at this point, `s` and `value` reference two different Strings. As `concat` is a destructive method, `value` is then modified in-place to `'HELLO!'`. The String object that `s` references does not affected, as before this line both `s` and `value` reference two different String objects. As `value.concat('!')` is the last evaluated expression of the method definition of `fix`, its return value is the method's return value. Hence, `fix(s)` returns `'HELLO!'`, which is then assigned to the local variable `t`.

Therefore, the result stated above follows.

### 26

What do `s` and `t` reference? Why?

````ruby
def fix(value)             # 1
  value << 'xyz'           # 2
  value = value.upcase     # 3
  value.concat('!')        # 4
end                        # 5
                           # 6
s = 'hello'                # 7
t = fix(s)                 # 8
````

After the execution of the above code, the local variables `s` and `t` reference `'helloxyz'` and `'HELLOXYZ!'` respectively.

On line 7, the local variable `s` is initialized and assigned to the String `'hello'`.

On line 8, the method `fix` is called with an argument `s`. The method parameter `value` is then assigned to the String that `s` is referencing, which is `'hello'`. `value` is then appended the String `'xyz'` destructively to `'helloxyz'`. This change is also reflected on `s`, because just before this line, both `s` and `value` reference the same Sting object. `value` is then re-assigned to a new String `'HELLOXYZ'`. As re-assignment break the link between variable and the object it previously referenced, at this point, both `s` and `value` reference two different String objects. `value` is then modified in-place to `'HELLOXYZ!'`. This change does not reflect on `s`, as `s` and `value` do not reference the same String just before this line. As `value.concat('!')` is the last evaluated expression of the method definition of `fix`, its return value is the method's return value, and thus `fix(s)` returns `'HELLOXYZ'` which is then assigned to the local variable `t`.

Therefore, after the execution of the above code, the local variables `s` and `t` reference `'helloxyz'` and `'HELLOXYZ!'` respectively.

### 27

What do `s` and `t` reference? Why?

````ruby
def fix(value)              # 1
  value = value.upcase!     # 2
  value.concat('!')         # 3
end                         # 4
                            # 5
s = 'hello'                 # 6
t = fix(s)                  # 7
````

On line 6, the local variable `s` is initialized and assigned to the String `'hello'`.

On line 7, the method `fix` is called with an arguement `s`. Upon the method invocation of `fix`, the method parameter `value` is assigned to the String that `s` is referencing, which is `'hello'`. `value` is then modified in-place to `'HELLO'`, and is then assigned back to `value`. Note that this re-assignement of `value` does not break the link between `value` and the object it previously referenced, because the return value of `value.upcase!` which is `value` itself (although modified) is assigned back to `value`. At this point, both `s` and `value` reference `'HELLO'`, because `upcase!` is a mutating method, the change is reflected in both `s` and `value`. `value` is then modified in place to `'HELLO!'`. Again, as `concat` is a mutating method, this change is also reflected in `s`. As `value.concat('!')` is the last evaluated expression of the method definition of `fix`, its return value is the method's return value. Hence, `fix(s)` returns `'HELLO!'` which is then assigned to the local variable `t`.

Therefore, after the execition of the above code, both `s` and `t` reference `'HELLO!'`.

### 28

What do `s` and `t` reference? Why?

````ruby
def fix(value)       # 1
  value[1] = 'x'     # 2
  value              # 3
end                  # 4
                     # 5
s = 'abc'            # 6
t = fix(s)           # 7
````

On line 6, the local variable `s` is initialized and assigned to the String `'abc'`.

On line 7, the method `fix` is called with an argument `s`. Upon the method invocation of `fix`, the method parameter `value` is assigned to the String that `s` is referencing, which is `'abc'`. The character at position `1` is then re-assigned to `x`. Hence `value` becomes `'axc'` after this indexed assignment. As indexed assignment (`String#[]=`) is a destructive operation, this change is also reflected on `s`, as both `s` and `value` reference the same String just before this line. As the last evaluated expression of the method definition of `fix` is `value`, `value`, which references `'axc'` at the moment, is returned by `fix(s)`. The return value of `fix(s)` is then assigned to the local variable `t`.

Hence, after the execution of the above code, both `s` and `t` reference the same String `'axc'`.

### 29

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def a_method(string)     # 1
  string << ' world'     # 2
end                      # 3
                         # 4
a = 'hello'              # 5
a_method(a)              # 6
                         # 7
p a                      # 8
````

The above code outputs `"hello world"` to the console, and returns `"hello world"`.

On line 5, the local variable `a` is initialized and assigned to the String `'hello'`.

On line 6, the method `a_method` is called with an argument `a`. Upon the method invocation of `a_method`, the method parameter `string` is assigned to the String that `a` is referencing, which is `'hello'`. `string` is then appended the string `' world'` destructively to `'hello world'`. As just before this line both `a` and `string` reference the same String `'hello'`, and `String#<<` is a mutating method, this change is reflected on both `a` and `string`.

Hence, when the `p` method is called with an argument `a` on line 8, it outputs `"hello world"` to the console and returns the same String.

### 30

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
num = 3           # 1
num = 2 * num     # 2
````

On line 1, the local variable `num` is initialized and assigned to the Integer `3`.

On line 2, `num` is re-assigned to a new Integer `2 * num`, which is calculated to be `6`.

As assignment statement returns the assigned value, the line 2 returns `6` and outputs nothing to the console.

### 31

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = %w(a b c)     # 1
a[1] = '-'        # 2
p a               # 3
````

The line 3 outputs `["a", "-", "c"]` to the console and returns `["a", "-", "c"]`.

On line 1, the local variable `a` is initialized and assigned to the Array `["a", "b", "c"]`.

On line 2, the element at position 1 of the Array `a` is re-assigned to a new String "-". As element assignment (`Array#[]=`) is a mutating method, `a` is mutated to `["a", "-", "c"]`.

Therefore, when the `p` method is called with an argument `a`, it outputs `["a", "-", "c"]` to the console and returns `["a", "-", "c"]`.

### 32

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def add_name(arr, name)     # 1
  arr = arr + [name]        # 2
end                         # 3
                            # 4
names = ['bob', 'kim']      # 5
add_name(names, 'jim')      # 6
puts names                  # 7
````

On line 5, the local variable `names` is initialized and assigned to the Array `['bob', 'kim']`.

On line 6, the method `add_name` is called with arguments `names` and `'jim'`. Upon the invocation of `add_name`, the method parameters `arr` and `name` are respectively assigned to the object which `names` is referencing (which is `['bob', 'kim']`) and `'jim'`. At this point, both `names` and `arr` reference the same Array `['bob', 'kim']`. `arr` is then re-assigned to a new array with an element added, which is `['bob', 'kim', 'jim']`. As `Array#+` is a non-mutating method, this change is not reflected on `names`. `add_name(names, 'jim')` returns `['bob', 'kim', 'jim']` and is not assigned to any variables.

Therefore, when the `puts` method is called with an argument `names`, it outputs `bob` and `kim` (in separate line) to the console and returns `nil`.

### 33

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
def add_name(arr, name)     # 1
  arr = arr << name         # 2
end                         # 3
                            # 4
names = ['bob', 'kim']      # 5
add_name(names, 'jim')      # 6
puts names                  # 7
````

On line 5, the local variable `names` is initialized and assigned to the Array `['bob', 'kim']`.

On line 6, the method `add_name` is called with arguments `name` and `'jim'`. Upon the method invocation of `add_name`, the method parameters `arr` and `name` are respectively assigned to the Array that `names` is referencing (which is `['bob', 'kim']`) and `'jim'`. At this point , both `names` and `arr` reference the same Array `['bob', 'kim']`. `arr` is then append an element `'jim'` destructively to `['bob', 'kim', 'jim']`. As `Array#<<` is a mutating method, this change is reflected in both the variables `arr` and `names`.

Therefore, when the `puts` method is called with an argument `names`, it outputs `bob`, `kim` and `jim` (in separate line) to the console and returns `nil`.

## `each`, `select`, and `map`

### 34

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
array = [1, 2, 3, 4, 5]      # 1
                             # 2
array.select do |num|        # 3
    puts num if num.odd?     # 4
end                          # 5
````

The above code returns an empty array (`[]`), and outputs `1`, `3` and `5`.

On line 1, the local variable `array` is initialized and assigned to the Array object `[1, 2, 3, 4, 5]`. On line 3, the `select` method is called on `array`, and passed in the `do...end` block on lines 3 to 5 as an argument. Upon the method invocation of `select`, every element in `array` runs through the `do...end` block, and is put into a new array for output if the return value of the block is truthy for that element. If the element is an odd number, the last evaluated expression is `puts num` and returns `nil`, which is falsy, and thus odd numbers are not selected. If the element is an even number, the conditional on line 4 is not run and thus the block returns `nil`, which is again falsy, and thus even numbers are not selected either. Therefore, no element in `array` is selected and an empty array is returned. For odd numbers, the `puts num` statement on line 4 is run, hence outputting `1`, `3` and `5`.

This example demonstrates the difference between `puts` and return values. `puts` here outputs the odd numbers to the console, but returns `nil`. Since the block's return value is `nil` for odd numbers, they are not selected. To select odd numbers, we should replace the if-conditional in the block with `num.odd?`. In that case, the output would be `[1, 3, 5]`.

### 35

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
arr.select { |n| n.odd? }                 # 3
````

The above code does not output anything to the console, and returns `[1, 3, 5, 7, 9]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 3, the `select` method is called on `arr` with the block `{ |n| n.odd? }` passed in as an argument. Upon the method invocation of `select`, every element in `arr` is passed into the block. The element is put into a new array for return if the block's return value is truthy for that element. Within the block, the last evaluated expression is `n.odd?`, which returns `true` for odd numbers and `false` for even numbers, and thus all odd numbers in `arr` is selected and returning `[1, 3, 5, 7, 9]`.

This code demonstrates...?

### 36

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
new_array = arr.select do |n|             # 3
  n + 1                                   # 4
end                                       # 5
                                          # 6
p new_array                               # 7
````

The above code outputs `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and returns `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 3, the method `select` is called on `arr` and passed in the `do...end` block on lines 3 to 5 as an argument. Upon the invocation of `select`, every element in `arr` is passed into the `do...end` block. The element is put into a new array for return if the block's return value is truthy for that element. For every element in `arr`, it is assigned to the block parameter `n` and runs through the block. As for all `n`, the block's return value is `n + 1` (the last evaluated expression), which is always truthy, all elements in `arr` are selected. The return array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` by the `select` method is then assigned to the local varaible `new_array`.

On line 7, the `p` method is invoked and passed in the variable `new_array` as an argument, hencing outputting and returning `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

This code demonstrates...?

### 37

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
new_array = arr.select do |n|             # 3
  n + 1                                   # 4
  puts n                                  # 5
end                                       # 6
                                          # 7
p new_array                               # 8
````

The above code outputs `1`, `2` through `10` and `[]`, and returns `[]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 3, the `select` method is called on `arr` on passed in the `do...end` block on lines 3 to 6 as an argument. For every element in `arr`, it is assigned to the block parameter `n` and run through the block. Hence on line 5, it outputs every element in `arr` to the console. The `select` method puts elements to a new array for return based on the truthiness of the block's return value. As for every element, the last evaluated expression of the `do...end` block is `puts n`, which returns `nil` and is falsy, no element is selected. Therefore an empty array is returned by the `select` method. The return value (`[]`) is then assigned to the local variable `new_array`.

On line 8, the `p` method is called with a variable `new_array` passed in as an argument, hence outputting `[]` and return `[]`.

This code demonstrates...?

### 38

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
words = %w(jump trip laugh run talk)     # 1
                                         # 2
new_array = words.map do |word|          # 3
  word.start_with?("t")                  # 4
end                                      # 5
                                         # 6
p new_array                              # 7
````

The above code outputs `[false, true, false, false, true]` and returns `[false, true, false, false, true]`.

On line 1, the local variable `words` is initialized and assigned to the Array object `['jump', 'trip', 'laugh', 'run', 'talk']`.

On line 3, the method `map` is called on `words` and passed in the `do...end` block on lines 3 to 5 as an argument. For each iteration, each element in `words` is assigned to the block parameter `word` and run through the block. The `map` method will return a new transformed array, where each element in the return way is the return value of the `do...end` block of the corresponding element. In this case, the last evaluated expression is `word.start_with?("t")`. Its return value will be the block's return value. `word.start_with("t")` returns `true` if `word` starts with `"t"` and `false` if otherwise. For each element in `words`, the block's return value is respectively `false`, `true`, `false`, `false` and `true`, and thus the `map` method returns a new array `[false, true, false, false, true]`. The return array is then assigned to the local variable `new_array`.

On line 7, the `p` method is called and passed in the variable `new_array` as an argument, hence outtputing `[false, true, false, false, true]` to the console and returning `[false, true, false, false, true]`.

This code demonstrates...?

### 39

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
arr.each { |n| puts n }                   # 3
````

The above code outputs `1`, `2`, `3`, ..., and `10` to the console and returns `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 1, the local variable `arr` is assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 3, the `each` method is called on `arr` and passed in the block `{ |n| puts n }` as an argument. For each iteration, each element in `arr` is assigned to the block parameter `n` and run through the block. Inside the block, the statement `puts n` outputs every element in `arr` to the console, hencing outputting `1`, `2`, `3`, ... , and `10` to the console. The `each` method ignores the return value of the block and returns the calling object, hence returning `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

This code demonstrates...?

### 40

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
incremented = arr.map do |n|              # 3
  n + 1                                   # 4
end                                       # 5
                                          # 6
p incremented                             # 7
````

The above code outputs `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` to the console and returns `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 3, the `map` method is called on `arr` and passed in the block on lines 3 to 5 as an argument. For each iteration, each element in `arr` is assigned to the block parameter `n` and run through the block. The `map` method will return a new array with each element transformed based on the return value of the block. As the last evaluated expression of the block is `n + 1`, every element in `arr` will be incremented by `1`, hence the `map` method will return a new array `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`. The return array is then assigned to the local variable `incremented`.

On line 7, the `p` method is called and passed in the local variable `incremented` as an argument, hence outputting `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` to the console and returning `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

This code demonstrates...?

### 41

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
new_array = arr.map do |n|                # 3
  n > 1                                   # 4
end                                       # 5
                                          # 6
p new_array                               # 7
````

The above code outputs `[false, true, true, true, true, true, true, true, true, true]` to the console and returns `[false, true, true, true, true, true, true, true, true, true]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 3, the `map` method is called on `arr` and passed in the block on lines 3 to 5 as an argument. For each iteration, each element in `arr` is assigned to the block parameter `n` and run through the block. The `map` method will return a new array with each element transformed based on the return value of the block. Each element in the return array will be the block's return value for the corresponding element in the calling array. As the last evaluated expression of the block is `n > 1`, its return value would be the block's return value. In this case, the block returns `false` for the first element (`1`) and `true` for the others, hence the `map` method will return a new array `[false, true, true, true, true, true, true, true, true, true]`. The return array is then assigned to the local variable `new_array`.

On line 7, the `p` method is called and passed in the local variable `new_array` as an argument, hence outputting `[false, true, true, true, true, true, true, true, true, true]` to the console and returning `[false, true, true, true, true, true, true, true, true, true]`.

This code demonstrates...?

### 42

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
new_array = arr.map do |n|                # 3
  n > 1                                   # 4
  puts n                                  # 5
end                                       # 6
                                          # 7
p new_array                               # 8
````

The above code outputs `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]` to the console and returns `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 3, the `map` method is called on `arr` and passed in the block on lines 3 to 6 as an argument. For each iteration, each element in `arr` is assigned to the block parameter `n` and run through the block. The `map` will return a new array with each element transformed based on the return value of the block. Each element in the return array is the block's return value for the corresponding element in the calling array. As the last evaluated expression of the block is `puts n`, its return value will be the block return value. As the `puts` method always returns `nil`, each element in `arr` will be transformed to `nil` in the return array, hence returning `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`. The return array is then assigned to the local variable `new_array`.

On line 8, the `p` method is called and passed in the variable `new_array` as an argument, hence outputting `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]` to the console and returning `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

This code demonstrates...?

### 43

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = "hello"                   # 1
                              # 2
[1, 2, 3].map { |num| a }     # 3
````

The above code returns `["hello", "hello", "hello"]` and outputs nothing to the console.

On line 1, the local variable `a` is initialized and assigned to the String `"hello"`.

On line 3, the method `map` is called on the Array object `[1, 2, 3]` and passed in `{ |num| a }` as an argument. The method invocation of `map` alongside `{ |num| a }` defines a block and thus creating an inner scope within it. For each iteration, each element in `[1, 2, 3]` is in turn assigned to the block parameter `num` and run through the block. The `map` method will return a new array with each element in `[1, 2, 3]` transformed based on the return value of the block, i.e. each element in the new transformed array will be the block's return value for the corresponding element. Considering the block on line 3, as `a` is initialised outside the block, it is accessible inside the block. And, as the last evaluated expression of the block is `a`, its return value will be the block's return value. In this case, for every element in `[1, 2, 3]`, the block's return value is `a`, which points to the String `"hello"`. Therefore, the `map` method will return `["hello", "hello", "hello"]`.

This code demonstrates...?

### 44

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
[1, 2, 3].each do |num|     # 1
  puts num                  # 2
end                         # 3
````

The above code outputs `1`, `2`, and `3` to the console and returns `[1, 2, 3]`.

On line 1, the `each` method is called on the Array object `[1, 2, 3]` and passed in the `do...end` block on lines 1 to 3 as an argument. For every iteration, each element in `[1, 2, 3]` is in turn assigned to the block parameter `num` and run through the block.

Within the block on line 2, the `puts` method is called and passed in `num` as an argument, hence outputting `1`, `2` and `3` to the console.

The `each` method ignores the return value of the block and returns the calling object, hence returning `[1, 2, 3]`.

This code demonstrates...?

## Other Collection Methods

### 45

````ruby
[1, 2, 3].any? do |num|     # 1
  num > 2                   # 2
end                         # 3
````

The above code returns `true` and outputs nothing to the console.

The `any?` method is called on the Array object `[1, 2, 3]` on line 1 and passed in the `do...end` block on lines 1 to 3 as an argument. For every iteration, every element in `[1, 2, 3]` is in turn assigned to the block parameter `num` and run through the block. The `any?` method returns `true` (and stops iterating) if the block returns a truthy value for any element in the calling object, and `false` if otherwise. Since the block's last evaluated expression is `num > 2`, the block returns `true` if any number in `[1, 2, 3]` is greater than `2`. As the block's return value is `true` for one of the elements in the calling object (`3`), the `any?` method returns `true`.

### 46

````ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|     # 1
  value.size > 4                                           # 2
end                                                        # 3
````

The above code returns `false` and outputs nothing to the console.

The `any?` method is called on the Hash object `{ a: "ant", b: "bear", c: "cat" }` on line 1 and passed in the `do...end` block on lines 1 to 3 as an argument. For each iteration, each key-value pair is respectively assigned to the block parameter `key` and `value`, and run through the block. The `any?` method returns `true` if the block returns a truthy value for any key-value pair in the hash, and `false` if otherwise. As the block's last evalulated expression is `value.size > 4`, the block returns `true` if there is a value in the hash that has a length greater than `4`. As there is no value of length greater than `4` in the hash, the `any?` method return `false`.

### 47

````ruby
[1, 2, 3].all? do |num|     # 1
  num > 2                   # 2
end                         # 3
````

The above code returns `false` and outputs nothing to the console.

The `all?` method is called on the Array object `[1, 2, 3]` on line 1 and passed in the `do...end` block on lines 1 to 3 as an argument. For each iteration, each element in the array is assigned to the block parameter `num` and run through the block. The `all?` method returns `true` if the block returns `true` for all elements in the calling object, and `false` if otherwise. Since the block's last evaluated expression is `num > 2`, `all?` will return `true` if all elements in the array are greater than `2`. As there is only one element in the array that is greater than `2`, the `all?` method returns `false`.

### 48

````ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|     # 1
  value.length >= 3                                        # 2
end                                                        # 3
````

The above code returns `true` and outputs nothing to the console.

The `all?` method is called on the Hash object `{ a: "ant", b: "bear", c: "cat" }` on line 1 and passed in the block on lines 1 to 3 as an argument. For each iteration, each key-value pair is respectively assigned to the block's parameres `key` and `value`, and then run through the block. The `all?` method returns `true` if the block returns `true` for all key-value pairs in the hash. Since the block's last evaluated expression is `value.length >= 3`, its return value would be the block's return value. Looking at the calling hash, the values are all greater than `3` in length. Therefore the block returns `true` for all key-value pairs in the hash, and thus the `all?` method returns `true`.

### 49

````ruby
[1, 2, 3].each_with_index do |num, index|     # 1
  puts "The index of #{num} is #{index}."     # 2
end                                           # 3
````

The above code returns `[1, 2, 3]`, and outputs `The index of 1 is 0.`, `The index of 2 is 1.` and `The index of 3 is 2.` to the console.

On line 1, the `each_with_index` is called on the Array object `[1, 2, 3]` and passed in the block on lines 1 to 3 as an argument. For each iteration, each element in the array is assigned to the block parameter `num`, and run through the block with another parameter `index` which starts at `0` and is incremented by `1` for each iteration. For each iteration, on line 2, the method `puts` is called and passed in the interpolated string `"The index of #{num} is #{index}."` (with block parameters `num` and `index`) as an argument, hencing outputting `The index of 1 is 0.`, `The index of 2 is 1.` and `The index of 3 is 2.` to the console. The `each_with_index` ignores the return value of the block and always returns the calling object, hence returning `[1, 2, 3]`.

### 50

````ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|     # 1
  array << pair.last                                                        # 2
end                                                                         # 3
````

The above code returns `["ant", "bear", "cat"]` and outputs nothing to the console.

On line 1, the `each_with_object` method is called on the Hash object `{ a: "ant", b: "bear", c: "cat" }` and passed in an empty array `[]` and the block on lines 1 to 3 as arguments. For each iteration, each key-value pair and the given argument are respectively assigned to the block parameters `pair` (as a two-element array, the first element is the key, and the second is the value) and `array`, and then run throughh the block. For each iteration, on line 2, the last element in `pair`, which is the value of every key-value pair, is push to the given array `array`, hence `array` will be `["ant", "bear", "cat"]` after iterating all key-value pairs. The `each_with_object` returns the given argument, which is now mututated to `["ant", "bear", "cat"]`, hence it is the return value.

### 51

````ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|     # 1
  hash[value] = key                                                                # 2
end                                                                                # 3
````

The above code returns `{"ant"=>:a, "bear"=>:b, "cat"=>:c}` and outputs nothing to the console.

On line 1, the `each_with_object` method is called on the Hash object `{ a: "ant", b: "bear", c: "cat" }` and passed in an empty hash `{}` and the block on lines 1 to 3 as arguments. For each iteration, each key-value pair's key and value, and the given hash are respectively assigned to the block parameters `key`, `value` and `hash`, and run through the block. On line 2, the given hash's key and value are respectively assigned as the value and the key of the current key-value pair of the calling hash for every iteration. Therefore, the given hash will become `{"ant"=>:a, "bear"=>:b, "cat"=>:c}` after iterating all key-value pairs in the calling hash. The `each_with_object` returns the given arguement, which is now mutated to `{"ant"=>:a, "bear"=>:b, "cat"=>:c}`, hence it is the return value.

### 52

````ruby
odd, even = [1, 2, 3].partition do |num|     # 1
  num.odd?                                   # 2
end                                          # 3
                                             # 4
p odd                                        # 5 
p even                                       # 6
````

The above code will return `[[1, 3], [2]]`, `[1, 3]` and `[2]`, and output `[1, 3]` and `[2]` to the console.

On line 1, the `partition` method is called on the Array object `[1, 2, 3]` and passed in the block on lines 1 to 3 as an argument. The `partition` method will return a two-dimensional array with two sub-arrays. The first sub-array will contain elements in the calling array for which the block returns a truthy value, while the second one will contain elements in the calling array for which the block returns a falsy value. As the last evaluated expression of the block is `num.odd?`, its return value would be the block's return value. In this case, the block will return `true` if the element is an odd number, and `false` if otherwise. Therefore, the `partition` method will return `[[1, 3], [2]]`.

The return array with two sub-arrays is then parallelly assigned to two local variables `odd` and `even`. The first sub-array is assigned to `odd` and the second is assigned to `even`. Therefore `odd` and `even` respectively point to `[1, 3]` and `[2]`.

On lines 5 and 6, the `p` method is called and passed in the local variables `odd` and `even` respectively as an argument, hencing returning `[1, 3]` and `[2]`, and outputting `[1, 3]` and `[2]` to the console.

## Truthiness

### 53

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
a = "Hello"                  # 1
                             # 2
if a                         # 3
  puts "Hello is truthy"     # 4
else                         # 5
  puts "Hello is falsey"     # 6
end                          # 7
````

The above code outputs `Hello is truthy` to the console and returns `nil`.

On line 1, the local variable `a` is initialised and assigned to the String `"Hello"`.

Considering the if-conditionals on lines 3 to 7, as `"Hello"` evaluates to `true` in Ruby, the if clause (line 4) is executed.

On line 4, the `puts` method is called with the String `"Hello is truthy"` passed in as an argument, hence outputting `Hello is truthy` to the console. As the `puts` method always returns `nil`, hence returning `nil`.

This code demonstrates the concept of truthiness in Ruby; specifically the fact that any objects other than `nil` and `false` evaluate to `true` in Ruby.

### 54

What does the following code return? What does it output? Why? What concept does it demonstrate?

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

The above code outputs `interview` to the console and returns `nil`.

On line 5, the local variable `var` is initialised and assigned to either the object referenced by a local variable called `test` or the value returned by a method called `test`.

Observing the code, we know that `test` refers to the method defined on lines 1 to 3. In the method definition of `test` on lines 1 to 3, the last evaluated expression is `puts "written assessment"`. Its return value will be the method's return value. As the `puts` method always returns `nil`, the method `test` always return `nil`. Therefore, on line 5, the local variable `var` is assigned to `nil`.

Consider the if-conditional on lines 7 to 11, as `nil` evaluates to `false` in Ruby, the else clause (line 10) is executed.

On line 10, the `puts` method is called and passed in the String `"interview"` as an argument, hence outputting `interview` to the console. As the `puts` method always returns `nil`, hence returning `nil`.

This code demonstrates the concept of truthiness in Ruby; specifically the fact that `nil` evaluates to `false` in Ruby.

## `puts` vs `return`

### 55

What does the following code output? What is the return value of `a` and why?

````ruby
a = puts "stuff"     # 1
puts a               # 2
````

The above code outputs `stuff` and an empty line to the console, and the return value of `a` is `nil`.

On line 1, the `puts` method is called and passed in the String object `"stuff"` as an argument, hencing outputting `stuff` to the console. The return value of the `puts` method is then assigned to the local variable `a`. As the `puts` method always returns `nil`, the local variable `a` references `nil`.

On line 2, the `puts` method is called and passed in the local variable `a` as an argument. As `a` points to `nil`, an empty line is outputted to the console.

### 56

What does the following code output and why?

````ruby
def add_three(number)             # 1
  return number + 3               # 2
  number + 4                      # 3
end                               # 4
                                  # 5
returned_value = add_three(4)     # 6
puts returned_value               # 7
````

The above code outputs `7` to the console.

On line 6, the `add_three` method is called and passed in the Integer `4` as an argument.

The `add_three` method is defined on lines 1 to 4. Upon the method invocation of `add_three` with an argument `4`, `4` is assigned to the method parameter `number`. `number` is then added `3` on line 2, and then returned by the `add_three` method. After executing line 2, the `return` keyword returns `number + 3`, which is `7`, and exits the method. The line of code after line 2 will not be run. Hence the return value of the `add_three` method is `7` in this case.

On line 6, the local variable `returned_value` is initialized and assigned to the return value by `add_three` (which is `7`).

On line 7, the `puts` method is called and passed in `returned_value` as an argument, hence outputting `7` to the console.

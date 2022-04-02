# Practice Problems

## Local Variable Scope

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

## `each`, `select`, and `map`

### 33

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

### 34

What does the following code return? What does it output? Why? What concept does it demonstrate?

````ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     # 1
                                          # 2
arr.select { |n| n.odd? }                 # 3
````

The above code does not output anything to the console, and returns `[1, 3, 5, 7, 9]`.

On line 1, the local variable `arr` is initialized and assigned to the Array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 3, the `select` method is called on `arr` with the block `{ |n| n.odd? }` passed in as an argument. Upon the method invocation of `select`, every element in `arr` is passed into the block. The element is put into a new array for return if the block's return value is truthy for that element. Within the block, the last evaluated expression is `n.odd?`, which returns `true` for odd numbers and `false` for even numbers, and thus all odd numbers in `arr` is selected and returning `[1, 3, 5, 7, 9]`.

This code demonstrates ...?

### 35

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

This code demonstrates ...?
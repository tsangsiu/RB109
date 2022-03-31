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
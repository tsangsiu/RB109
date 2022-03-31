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

# An Example from Study Guide

Example the code example below. The last line outputs the String `'Hi'` rather than the String `'Hello'`. Explain what is happening here and identify the underlying principle that this demonstrates.

````ruby
greeting = 'Hello'     # 1
                       # 2
loop do                # 3
  greeting = 'Hi'      # 4
  break                # 5
end                    # 6
                       # 7
puts greeting          # 8
````

On line 1, the local variable `greeting` is initialized and assigned to the String `'Hello'`.

On line 3, the `loop` method is called and passed in the `do...end` on lines 3 to 6 as an argument. The method invocation of `loop` alongside the `do...end` defines a block and creates an inner scope within it.

Inside the block, `greeting` is re-assigned to the String `'Hi'`. As `greeting` was initialized in an outer scope, it is accessible inside the block.

On line 8, the `puts` method is called and passed in `greeting` as an argument. As `greeting` now references the String object `'Hi'`, hence outputting `'Hi'` to the console.

This code demonstrates the local variable scoping rules in Ruby; specifically the fact that local variables initialized outside a block are accessible within the block.

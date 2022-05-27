=begin

You are given two non-negative integers num1 and num2.

In one operation, if num1 >= num2, you must subtract num2 from num1, otherwise subtract num1 from num2.
For example, if num1 = 5 and num2 = 4, subtract num2 from num1, thus obtaining num1 = 1 and num2 = 4. However, if num1 = 4 and num2 = 5, after one operation, num1 = 4 and num2 = 1.

Return the number of operations required to make either num1 = 0 or num2 = 0.

# Problem
- Given two numbers `num1` and `num2`,
- If `num1` >= `num2`, set `num1` = `num1` - `num2`
- Else, set `num2` = `num2` - `num1`
- Repeat the above operation until one of `num1` and `num2` is 0
- Return the number of operation performed to reach that

# Algorithm
- Initialize `count` to 0
- Until either `num1` is 0 or `num2` is 0,
  - if `num1` >= `num2`,
    - set `num1` to `num1` - `num2`
  - else
    - set `num2` to `num2` - `num1`
  - Increment `count` by 1
- return `count`

=end

# Code
def count_operations(num1, num2)
  count = 0
  until num1 == 0 || num2 == 0
    num1 >= num2 ? num1 -= num2 : num2 -= num1
    count += 1
  end
  count
end

p count_operations(4, 4) == 1
p count_operations(10, 10) == 1
p count_operations(4, 3) == 4
p count_operations(2,3) == 3
p count_operations(1, 2) == 2

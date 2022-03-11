=begin

Problem
- Rules/Requirements
  - Create a method called `power`
  - It takes two integers,
  - and returns the value of the first argument raised to the power of the second
  - Return nil if the second argument is negative
  - Not allowed to use the '**' operator
- Input: Two integers, the first one is the base, the second is the power
- Output: Integer

Examples
p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

Data Structure
- Input: Integer
- Intermediate: Integer
- Output: Integer

Algorithm
- Given two integers,
- If the second integer is less than 0,
  - return nil
- Else if the second integer is 0,
  - return 1
- Else
  - initalise an integer `num` to 1
  - loop for the number of times as stated by the second integer
    - multiply `num` by the first given integer
  - return `num`

=end

def power(base, power)
  if power < 0
    nil
  elsif power == 0
    1
  else
    num = 1
    power.times do
      num = num * base
    end
    num
  end
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

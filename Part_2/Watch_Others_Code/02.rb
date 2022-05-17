# You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1:

# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

=begin

# Problem
- Given a positive integer, return the next bigger number formed by the same digits
- If the next bigger number does not exist, return -1

# Examples
p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

# Brainstorm
- Generate all possible numbers using the digits
- Find the one which is the next bigger number than the given number

# Algorithm
- Turn the given number into an array of characters of digits
- If the array is sorted in descending order,
  - Return -1
- Else,
  - Loop
    - Increment the given number by 1
    - If the result number contains the same set of digits as the given number,
      - Return the result number
    - Else,
      - Increment the given number by 1

=end

def next_bigger_num(num)
  digits = num.to_s.chars
  return -1 if digits == digits.sort.reverse
  next_num = num + 1
  loop do
    if next_num.to_s.chars.sort == num.to_s.chars.sort
      return next_num
    else
      next_num += 1
    end
  end
end

p next_bigger_num(9) #== -1
p next_bigger_num(12) #== 21
p next_bigger_num(513) #== 531
p next_bigger_num(2017) #== 2071
p next_bigger_num(111) #== -1
p next_bigger_num(531) #== -1
p next_bigger_num(123456789) #== 123456798

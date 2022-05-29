=begin
  
You are given an integer array digits, where each element is a digit. The array may contain duplicates.

You need to find all the unique integers that follow the given requirements:

The integer consists of the concatenation of three elements from digits in any arbitrary order.
The integer does not have leading zeros.
The integer is even.
For example, if the given digits were [1, 2, 3], integers 132 and 312 follow the requirements.

Return a sorted array of the unique integers.

# Problem
- Given an array of digits
- Return a sorted array of integers that are
  - 3 digits
  - even
  - no leading zeros
- Input: array
- Output: array

# Algorithm
- Generate all possible arrangement of three digits from the given array and without reusing digits
- Select the numbers that are:
  - between 100 and 999 inclusively
  - even
- Sort the result array
- Return the array of unique numbers

=end

def find_even_numbers(digits)
  nums = []
  (0...digits.size).each do |hundreds|
    (0...digits.size).each do |tens|
      (0...digits.size).each do |units|
        if hundreds != tens && hundreds != units && tens != units
          nums << digits[hundreds] * 100 + digits[tens] * 10 + digits[units]
        end
      end
    end
  end

  nums = nums.select do |num|
    (num >= 100 && num <= 999) && num.even?
  end.sort.uniq
end

p find_even_numbers([2,1,3,0]) == [102,120,130,132,210,230,302,310,312,320]
p find_even_numbers([2,2,8,8,2]) == [222,228,282,288,822,828,882]

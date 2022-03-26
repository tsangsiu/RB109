=begin

Problem
Rules/Requirements
- Given a list of n integers,
  - find the minimum number to be inserted in a list,
  - so that the sum of all elements of the list should equal the closet prime number
- Input: Array
- Output: Integer

Examples
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

Data Structures
- Input: Array
- Intermediate: Integer
- Output: Integer

Algorithm
- For the main program:
  - Given a list of n integer, calculate the sum of the integers
  - Find the smallest prime number that is larger than or equal to the sum
  - Find the difference between that number and the sum

- For the helper method to determine if a number is prime:
  - Given a number N,
    - Iterate through 2 to N-1
      - If that is a factor of N,
        - Return false
      - Return true

=end

def prime?(n)
  2.upto(n - 1) do |int|
    return false if n % int == 0
  end
  true
end

def prime?(n)
  (2..(n - 1)).none? { |num| n % num == 0 }
end

def minimum_number(array)
  sum = array.sum
  smallest_prime = sum
  loop do
    prime?(smallest_prime) ? break : smallest_prime += 1
  end
  smallest_prime - sum
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

# Write a method that takes two numbers. It should print out all primes between the two numbers. Don't use Ruby's `prime` class.

# ```
# find_primes(3, 10)

# # => 3, 5, 7
# ```

=begin
  
# Problem
- Given two numbers,
- print out all the primes numbers between the numbers, inclusively
- Input: Two integers
- Output: -

# Example
find_primes(3, 10) # => 3, 5, 7

# Algorithm
- The method `prime?`
  - This method accept a single integer and return if it's a prime number
  - Return false if the number < 2 or it's not an integer
  - Iterate from 2 to (the given number - 1)
    - If the given number % (the current number) == 0,
      - return false
  - return true

- The method `find_primes`
  - Initialize `primes` to an empty array 
  - Loop from the start integer to the end integer,
    - determine if that integer is a prime number using the method `primes?`
    - If the current is prime,
      - Push that number to `primes`
  - format the prime numnbers and print the result

=end

# Code
def prime?(num)
  return false if num < 2 || num.class != Integer
  2.upto(num - 1) { |int| return false if num % int == 0 }
  true
end

def find_primes(start_num, end_num)
  primes = []
  start_num.upto(end_num) do |int|
    primes << int if prime?(int)
  end
  puts primes.join(', ')
end

find_primes(3, 10)
find_primes(1, 100)
find_primes(1, 2)

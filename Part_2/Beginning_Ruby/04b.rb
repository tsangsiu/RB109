## Write a method that takes two arguments: the first is the starting number, adn the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# -----------------------------
# **input:**
# fizzbuzz(1, 15)

# **output:**
# 1, 2, "Fizz", 4 "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"

=begin

# Problem
- Given two numbers, one is the starting number, and the other is the ending number
- Print the numbers from the starting number to the ending number
- If a number is divisible by 3, print "Fizz" instead
- If a number is divisible by 5, print "Buzz" instead
- If a number is divisible by both 3 and 5, print "FizzBuzz"

# Algorithm
- Loop from the starting number to the ending number, both inclusive
  - Check if the current number is divisble by 15, if yes, print "FizzBuzz"
  - Else if the number is divisible by 3, print "Fizz"
  - Else if the number is divisible by 5, print "Buzz"
  - Else print the number

=end

# Code
def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    case
    when num % 15 == 0 then puts "FizzBuzz"
    when num % 3 == 0  then puts "Fizz"
    when num % 5 == 0  then puts "Buzz"
    else                    puts num
    end
  end
end

def fizzbuzz(start_num, end_num)
  output = []
  start_num.upto(end_num) do |num|
    case
    when num % 15 == 0 then print "FizzBuzz"
    when num % 3 == 0  then print "Fizz"
    when num % 5 == 0  then print "Buzz"
    else                    print num
    end
    print ", " if num != end_num
  end
end

fizzbuzz(1, 15)

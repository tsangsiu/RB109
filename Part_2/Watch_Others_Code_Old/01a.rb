# Write a method that will determine whether an integer is a prime. Do not use the Prime class.
def is_prime?(num)
  return false if num < 2 || num.class != Integer
  2.upto(num - 1) do |int|
    return false if num % int == 0
  end
  true
end

p is_prime?(3) == true
p is_prime?(4) == false

# Write a method that will take an array of methods and only return those that are prime.
def select_primes(arr)
  arr.select do |num|
    is_prime?(num)
  end
end

p select_primes([1, 2, 3, 4]) == [2, 3]
p select_primes([4, 6, 8, 10]) == []

# # Write a method that will take an array of numbers and return the number of primes in the array.
def count_primes(arr)
  arr.count do |num|
    is_prime?(num)
  end
end

p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0

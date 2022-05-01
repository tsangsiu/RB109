=begin

# Problem
- Given an Array,
  - Select its elements if the element's position index number is a finbonacci number
- Finbonacci numbers are 1, 1, 2, 3, 5, 8, 13, ...

# Examples
p select_fib_element([0, 1, 2, 3, 4, 5, 6, 7, 8]) == [1, 2, 3, 5, 8]
p select_fib_element([13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]) == [12, 11, 10, 8, 5, 0]

# Algorithm
- The main program:
  - Initialize an empty Array called `output`
  - Generate a sequence of fibonacci number up to (the length of the given Array - 1), and save it to `fibonacci_seq`
  - Given the Array,
    - Iterate through each element with index
    - If the index is a fibonacci number, push the element to `output`
  - Return `output`
- A method to generate a sequence of fibonacci number:
  - Given a number `n`, we are going to generate a sequence of fibonacci number up to `n`
  - Initialize an Array [1, 1] and save it to `fibonacci_seq`
  - While the last element of `fibonacci_seq` is less than `n`,
    - Find the next fibonacci number by adding the last two elements
    - If the sum is less than or equal to `n`,
      - Append it to `fibonacci_seq`
    - Else,
      - Break the while loop
  - Return `fibonacci_seq`

=end

def fibonacci_seq(n)
  fibonacci_seq = [1, 1]
  while fibonacci_seq.last < n
    next_fibonacci = fibonacci_seq[-1] + fibonacci_seq[-2]
    next_fibonacci <= n ? fibonacci_seq << next_fibonacci : break
  end
  fibonacci_seq
end

def select_fib_element(arr)
  output = []
  fibonacci_seq = fibonacci_seq(arr.length - 1)
  arr.each_with_index do |element, index|
    output << element if fibonacci_seq.include?(index)
  end
  output
end

# alternative solution
def select_fib_element(arr)
  fibonacci_seq = fibonacci_seq(arr.length - 1)
  arr.select.with_index do |element, index|
    fibonacci_seq.include?(index)
  end
end

p select_fib_element([0, 1, 2, 3, 4, 5, 6, 7, 8]) == [1, 2, 3, 5, 8]
p select_fib_element([13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]) == [12, 11, 10, 8, 5, 0]

# Follow-Up Questions

# 1. What if we want a destructive `select_fib_element!` method?

def select_fib_element!(arr)
  fibonacci_seq = fibonacci_seq(arr.length - 1)
  arr.select!.with_index do |element, index|
    fibonacci_seq.include?(index)
  end
end

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8]
select_fib_element!(arr)
p arr == [1, 2, 3, 5, 8]

arr = [13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
select_fib_element!(arr)
p arr == [12, 11, 10, 8, 5, 0]

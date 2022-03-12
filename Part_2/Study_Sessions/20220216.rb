=begin

Question:
Implement a method that calculates the sum of the integers inside a string. Only
positive integers will be test, e.g., "L12aun3ch Sch3oo45l".

Problem:
- input: string
- output: integer (sum)
- rules:
  - find the integers, calculate the sum
  - only positive integer will be tested
  - only care about the integers, ignore the rest of the string
  - consecutive integers are considered as one integer
  - no integers means that the sum is 0
  - we only care about the numbers

Question:
- What to do with consecutive integers? ('12' mean '1' + '2' or '12'?)

Examples:
p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0
p sum_of_integers("HELLO WORLD77!") == 77

Data Structures:
- input: string
- intermediate**: array
- output: integer

Brainstorm (Optional):
- To do iteration?
- Should I split the string? If so, how?
- How do I iterate to incorporate the array?
- If the next character is not a number, that's the end of the number
- Not only the next number, sometimes you need to look further - look until it's not an integer
- Nested iteration? Single iteration?
- Create an empty string to store an integer? What are the next steps necessary?

Algorithm:
- Luke's
  - accept a str as argument
  - create an empty array to contain the numbers
  - create an empty string for the current number
  - break the string apart and look at each character
    - if the character is a number
      - add it to the end of the current number
    - if the character is not a number
      - add the current number to the array
      - reset current number
  - sum the numbers of the array
  - return the sum
- Mine
  - initialize an empty string, say `number_string` to temporarily store the number in string
  - initialize an empty array, say `numbers` to store the numbers
  - split the string into an array of characters
  - loop through the array of characters
    - if it is an integer
      - append the character to `number_string`
    - else if `number_string` is not empty
      - change it to an integer
      - append it to `numbers`
      - set `number_string` to empty
  - calculate the sum of integers in `numbers`
  - return the sum

=end

# Code:

INTEGERS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
# INTEGER = ("0 ".."9").to_a

def sum_of_integers(string)
  number_string = ""
  numbers = []
  chars = string.chars
  chars.each do |char|
    if INTEGERS.include?(char)
      number_string << char
    else
      numbers << number_string.to_i if number_string != ""
      number_string = ""
    end
  end
  numbers.sum
end

p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0
p sum_of_integers("HELLO WORLD77!") == 77

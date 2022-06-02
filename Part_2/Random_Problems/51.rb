=begin

We have a string s
We have a number n

Here is a function that takes your string, concatenates the even-indexed chars to the front, odd-indexed chars to the back.

Examples
s = "Wow Example!"
result = "WwEapeo xml!"
s = "I'm JomoPipi"
result = "ImJm ii' ooPp"

The Task:
return the result of the string after applying the function to it n times.
example where s = "qwertyuio" and n = 2:
after 1 iteration  s = "qetuowryi"
after 2 iterations s = "qtorieuwy"
return "qtorieuwy"

# Problem
- Given a string `str
  - Take the even-indexed chars and put them to the front
  - Take the odd-indexed chars and put them at the back
- Given a number `n`, do the above process `n` times

"Such Wow!" -> "Sc o!uhWw"
"qwertyuio" -> "qetuowryi" -> "qtorieuwy"

# Algorithm
- Consider only doing the operation once:
  - Initialize `output` to [[], []]
  - Given a words,
    - Turn it into an array of individual characters
    - Iterate through the above array with index noted
      - If the index is even, push the current letter to the first sub-array of `output`
      - Else, push the current letter to the last sub-array of `output`
    - Combine the letters in each sub-array back to a string
    - Combine the strings to one string
    - Return the string
    
- The main method `jumbled_string`
  - Given the string and an integer `n`,
    - Run the above method with arguemnts `str` and `n` for n times
  - Return the result

=end

def jumbled_string_once(str)
  output = [[], []]
  chars = str.chars
  chars.each_with_index do |char, index|
    index.even? ? output.first << char : output.last << char
  end
  output = output.map { |str_half| str_half.join('') }
  output.join('')
end

def jumbled_string(str, n)
  n.times { |_| str = jumbled_string_once(str) }
  str
end

p jumbled_string("Such Wow!", 1) == "Sc o!uhWw"
p jumbled_string("better example", 2) == "bexltept merae"
p jumbled_string("qwertyuio", 2) == "qtorieuwy"
p jumbled_string("Greetings", 8) == "Gtsegenri"

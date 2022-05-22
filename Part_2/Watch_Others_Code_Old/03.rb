# Write a method that converts an english phrase into a mathematical expression, step by step.

NUMBERS = {
  "ZERO" => 0,
  "ONE" => 1,
  "TWO" => 2,
  "THREE" => 3,
  "FOUR" => 4,
  "FIVE" => 5,
  "SIX" => 6,
  "SEVEN" => 7,
  "EIGHT" => 8,
  "NINE" => 9
}

OPERATIONS = {
  "PLUS" => :+,
  "MINUS" => :-,
  "TIMES" => :*,
  "DIVIDED" => :/
}

def computer(expression)
  tokens = expression.split
  tokens.delete("by") # special treatment for division

  tokens.map! do |token|
    if NUMBERS.keys.include?(token.upcase)
      NUMBERS[token.upcase]
    elsif OPERATIONS.keys.include?(token.upcase)
      OPERATIONS[token.upcase]
    else
      token.to_i
    end
  end

  index = 0
  while index < tokens.size
    if [:*, :/].include?(tokens[index])
      tokens[(index - 1)..(index + 1)] = [tokens[index - 1], tokens[index + 1]].reduce(tokens[index])
      index = 0
    end
    index += 1
  end

  until tokens.size == 1
    tokens[0..2] = [tokens[0], tokens[2]].reduce(tokens[1])
  end
  tokens.first
end

p computer("two plus two") == 4
p computer('seven minus six') == 1
p computer('zero plus eight') == 8

# more operations
p computer('two plus two minus three') == 1
p computer("three minus one plus five minus 4 plus six plus 10 minus 4") == 15

# compute in order of appearance, not order of operations
# p computer("eight times four plus six divided by two minus two") == 17
# p computer('one plus four times two minus two') == 8
# p computer('nine divided by three times six') == 18

# compute using order of operations
p computer('eight times four plus six divided by two minus two') == 33
p computer('one plus four times two minus two') == 7
p computer('nine divided by three times six') == 18
p computer('seven plus four divided by two') == 9
p computer('seven times four plus one divided by three minus two') == 26
p computer('one plus four times three divided by two minus two') == 5
p computer('nine divided by three times six') == 18

# Write a program that asks the user to enter an integer greater than zero, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# assume correct input from users here, no checking on the inputs

print "Please enter an integer greater than zero: "
int = gets.chomp.to_i

print "Do you want the sum or product of all numbers between 1 and #{int}? [sum/product] "
operation = gets.chomp

if operation.downcase == "sum"
  result = (1..int).reduce(:+)
elsif operation.downcase == "product"
  result = (1..int).reduce(:*)
end

puts "The result is #{result}."

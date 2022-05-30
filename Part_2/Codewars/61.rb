=begin

Given: an array containing hashes of names

Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

Example:

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
# returns ''

Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

Problem
- Given an array of hashes of names,
- Return a string separated by commas
- Separate the last two name by '&'
- Input: array of hashes
- Output: string

Algorithm
- Given an array of hashes of name,
- Replace each hash with the name
- If the result array contains no name,
  - return an empty string
- Else if the result array contains only one name,
  - return it
- Else if the result array contains two names,
  - Join them with a '&' and return it
- Else,
  - Say there are n names,
  - Join the first (n-1) names with ', '
  - and append ' & ' + the last name
  - return it

=end

def list(arr)
  arr = arr.map { |hash| hash[:name] }
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(' & ')
  else        arr[0...-1].join(', ') + " & #{arr[-1]}"
  end
end

p list([{name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'}]) == 'Bart, Lisa & Maggie'
p list([{name: 'Bart'}, {name: 'Lisa'}]) == 'Bart & Lisa'
p list([{name: 'Bart'}]) == 'Bart'
p list([]) == ''

=begin

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

# Problem
- Given a hash describing what's inside each person's pocket, and an array of allowed items,
- Return the suspect whose pocket has not allowed items
- If no suspect is found ot there are no pockets, return `nil`
- Input: Hash, Array
- Output: Array

# Algorithm
- return nil if there are no pockets
- Initialize an empty array called `suspects`
- Iterate through each person
  - For each person, if his/her pockets contains not allowed items, push his/her name to `suspects`
- If `suspects` is empty, return `nil`,
- Else, return `suspects`

=end

def find_suspects(pockets, allowed_items)
  return nil if pockets.nil?
  return nil if pockets.values.all? { |pocket| pocket.nil? || pocket == [] }

  suspects = []
  pockets.each do |person, pocket|
    pocket.each do |item|
      if !allowed_items.include?(item)
        suspects << person
        break
      end
    end
  end
  suspects.empty? ? nil : suspects
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

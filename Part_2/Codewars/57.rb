=begin

Not to brag, but I recently became the nexus of the Codewars universe! My honor 
and my rank were the same number. I cried a little.

Complete the method that takes a hash/object/directory/association list of 
users, and find the nexus: the user whose rank is the closest is equal to his 
honor. Return the rank of this user. For each user, the key is the rank and the 
value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes 
closest. If there are several users who come closest, return the one with the 
lowest rank (numeric value). The hash will not necessarily contain consecutive 
rank numbers; return the best match from the ranks provided.

Example
         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }

# Problem
- Given a hash of users, find the nexus
- The nexus is the user whose rank is the closest to his honor
- If there are several users who come closest, return the one with the lowest rank

# Algorithm
- Create a duplicate of the given hash
- Re-order the key-value pair such that the lower rank comes first
- For each rank (key), set its value to be a hash containing:
  - The honor
  - The difference between the rank and honor
- Return the rank where the difference is the smallest
- If there are more than one difference which is the smallest, return the lowest rank

=end

def nexus(users)
  users_dup = users.dup
  users_dup = users_dup.sort_by { |key, _| key }.to_h
  users_dup = users_dup.each { |key, value| users_dup[key] = { honor: value } }
  users_dup = users_dup.each { |key, value| value[:difference] = (key - value[:honor]).abs }
  users_dup = users_dup.sort_by { |_, value| value[:difference] }.to_h
  users_dup.to_a.first.first
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2

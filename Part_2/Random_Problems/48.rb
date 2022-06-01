=begin

Write a function that returns the positions and the values of the "peaks" (or 
local maxima) of a numeric array.

For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a 
value of 5 (since arr[3] equals 5).

The output will be returned as an object with two properties: pos and peaks. 
Both of these properties should be arrays. If there is no peak in the given 
array, then the output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return 
{pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be 
empty), so you won't need to validate the input.

The first and last elements of the array will not be considered as peaks (in the
context of a mathematical function, we don't know what is after and before and 
therefore, we don't know if it is a peak or not).

Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] 
and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the 
position and value of the beginning of the plateau. For example: 
pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in 
other languages)

# Problem
- Given a numberic array, return a hash of all peaks and their index position
- An element in the array is said to be a peak if the elements besides it are smaller than it
- The first and last elements are not counted as peaks
- If there are plateaus, return only the beginning of the plateaus
- **note the position 1 in [2, 4, 4, 4, 4, 4] is not a pleateau,
  but [2, 4, 4, 4, 4, 2] is

# Algoithm
- Initialize a hash called `peaks` as {"pos"=>[], "peaks"=>[]}
- Iterate through the given array (from the second to the second last element),
  - if the current element is larger than both the elements besides it,
    - push the current index position and the element value to `peaks`
  - If the current element is larger than the left element but equal to the right element
    - Go to the right of the array to see if there is an element smaller than the current element
      - If yes, push the current index position and the element value to `peaks`
- Return `peaks`

=end

def pick_peaks(arr)
  peaks = {"pos"=>[], "peaks"=>[]}
  arr.each_with_index do |element, index|
    if (1...(arr.size - 1)).include?(index) && element > arr[index - 1] && element > arr[index + 1]
      peaks["pos"] << index
      peaks["peaks"] << element
    elsif (1...(arr.size - 1)).include?(index) && element > arr[index - 1] && element == arr[index + 1]
      
      arr[(index + 2)..].each do |element_right|
        if element > element_right
          peaks["pos"] << index
          peaks["peaks"] << element
          break
        end
      end
      
    end
  end
  peaks
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}

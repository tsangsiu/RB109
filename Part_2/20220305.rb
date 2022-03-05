=begin

Problem
- Rules:
  - Given a two-dimensional array (represents a field),
  - return the location of '1' (represents the mine) 
  - The field is a square in any dimension
- Questions:
  - Is there only one mine?
    - Yes.
- Input: Array (2D array)
- Output: Array (1D array, coordinates)

Examples:
p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == [1, 1]
p mine_location([[0, 0, 0], [0, 0, 0], [0, 1, 0]]) == [2, 1]
p mine_location([[1, 0], [0, 0]]) == [0, 0]
p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0]]) == [2, 2]

Data Structures:
- Input: Array
- Intermediate: Array
- Output: Array

Algorithm:
- Given a two-dimensional array,
  - iterate through each sub-array
    - For each sub-array, iterate through each element
      - If the element is 1
        - note its index and that of the corresponding sub-array
        - save it in an array as coordinates
        - break the loop
- Return the coordinates array

=end

# Code:
def mine_location(field)
  coordinate = nil
  field.each_with_index do |layer, layer_index|
    layer.each_with_index do |element, element_index|
      if element == 1
        coordinate = [layer_index, element_index]
        break
      end
    end
    break if coordinate
  end
  coordinate
end

p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == [1, 1]
p mine_location([[0, 0, 0], [0, 0, 0], [0, 1, 0]]) == [2, 1]
p mine_location([[1, 0], [0, 0]]) == [0, 0]
p mine_location([[1, 0, 0], [0, 0, 0], [0, 0, 0]]) == [0, 0]
p mine_location([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0]]) == [2, 2]

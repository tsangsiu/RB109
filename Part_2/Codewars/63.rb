=begin

You probably know the "like" system from Facebook and other pages. People can 
"like" blog posts, pictures or other items. We want to create the text that 
should be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input 
array, containing the names of people who like an item. It must return the 
display text as shown in the examples:

# Problem
- Given an array of names,
- Return a string like the following patterns:
  - p likes [] == "no one likes this"
  - p likes ["Peter"] == "Peter likes this"
  - p likes ["Jacob", "Alex"] == "Jacob and Alex like this"
  - p likes ["Max", "John", "Mark"] == "Max, John and Mark like this"
  - p likes ["Alex", "Jacob", "Mark", "Max"] == "Alex, Jacob and 2 others like this"

=end

def likes(arr_names)
  case arr_names.size
  when 0 then "no one likes this"
  when 1 then "#{arr_names.first} likes this"
  when 2 then "#{arr_names.join(' and ')} like this"
  when 3 then "#{arr_names[0]}, #{arr_names[1]} and #{arr_names[2]} like this"
  else        "#{arr_names[0..1].join(', ')} and #{arr_names[2..].size} others like this"
  end
end

p likes([]) == "no one likes this"
p likes(["Peter"]) == "Peter likes this"
p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"

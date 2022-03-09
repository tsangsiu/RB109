=begin

Problem
- Rules/Requirements:
  - Given a receipe and available ingredients,
  - return the maximum number of cakes can bake
- Input: Two Hashes (each for receipe and ingredients)
- Output: Integer (the maximum number of cakes that can bake)

Examples
p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1}, {"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}, {"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}, {"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}, {"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400}, {}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1}, {"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1

Data Structures
- Input: Two Hashes (each for receipe and ingredients)
- Intermediate: Array (to store the number of cake that can bake by that particular ingredient)
- Output: Integer (the maximum number of cakes that can bake)

Algorithm
- Initialise an array to store the number of cakes can bake with one particular ingredient
- Given a receipe and available ingredients,
- For each ingredient in the receipe,
  - if that ingredient is available,
    - find out how many ingredients are at hand
    - find out how many cakes can bake with that amount of ingredient
    - append the result to the initialised array
  - if that ingredient is not available,
    - return 0 for the function
- The number of cakes that bake should be the smallest number in the array

=end

# Code

def cakes(receipe, ingredients)
  num_cakes_by_ingredient = []
  receipe.each_pair do |ingredient, amount|
    if ingredients.keys.include?(ingredient)
      num_cakes_by_ingredient << ingredients[ingredient] / amount
    else
      return 0
    end
  end
  num_cakes_by_ingredient.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1}, {"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}, {"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}, {"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}, {"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400}, {}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1}, {"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1

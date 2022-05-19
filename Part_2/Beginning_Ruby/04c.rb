PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

=begin

# Problem
- Given a constant array called `PRODUCTS` and a query
- Based on the query, return a subset array from `PRODUCTS`

- Input: product array, query hash
- Output: new sub-array of the given product array

# Algorithm
- Given the query,
  - first, select product hashes in `PRODUCTS` which name contains the string represented by the key :q
  - then, further select product which price ranges from :price_min to :price_max, both inclusive
- print the array of product hashes which fullfill the query

=end

# Code
def search(query)
  products = PRODUCTS.select do |product|
    product[:name].downcase.include?(query[:q].downcase) &&
    product[:price] >= query[:price_min] && product[:price] <= query[:price_max]
  end
  p products
end

search(query)
# [ { name: "Thinkpad x220", price: 250 } ]

search(query2)
# [ { name: "Dell Inspiron", price: 300 }, { name: "Dell Inspiron", price: 450 } ]

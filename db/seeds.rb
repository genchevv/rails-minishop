10.times do |product|
    price = rand(5..30)
   Product.create!(
       title: "Product #{product}",
       description: "Product Description #{product}",
       price: price
    )
end

puts "10 Products created"
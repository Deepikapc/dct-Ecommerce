# 100.times do
# 	product = Product.new
# 	product.name = Faker::Commerce.product_name
# 	product.price = Faker::Commerce.price(10,1000)
# 	product.description = Faker::Lorem.paragraph
#     product.stock = Faker::Number.number(3)
#     product.cod_eligibility = [true,false].sample
#     category = Category.all.sample
#     product.category_id = category.id
#     product.sub_category_id = category.sub_categories.sample.id
#     product.save
# end

# 1)find cod_eligibility is false
# Product.where('cod_eligibility = ?',false)

# 2)find products whose price is >750
# Product.where('price > ?',750)

# 3)find products price >250 && <500
# Product.where('price > ? AND price < ?',250,500)
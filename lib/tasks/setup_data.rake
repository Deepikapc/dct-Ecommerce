task :setup_data => :environment do

  Category.delete_all
  SubCategory.delete_all

  Category.create(name: "Sports, Fitness, & Outdoors")
  Category.create(name: "Home, Kitchen & Pets")
  Category.create(name: "Books")
  Category.create(name: "Shoes")

  SubCategory.create(name: "Cricket", category_id: Category.first.id)
  SubCategory.create(name: "Badminton", category_id: Category.first.id )
  SubCategory.create(name: "Swimming", category_id: Category.first.id)
  SubCategory.create(name: "Home Improvement", category_id: Category.second.id)
  SubCategory.create(name: "Furniture", category_id: Category.second.id)
  SubCategory.create(name: "Pet supplies", category_id: Category.second.id)
  SubCategory.create(name: "Textbooks", category_id: Category.third.id)
  SubCategory.create(name: "ebooks", category_id: Category.third.id)
  SubCategory.create(name: "Exam central", category_id: Category.third.id)
  SubCategory.create(name: "Sneakers", category_id: Category.fourth.id)
  SubCategory.create(name: " Formal shoes", category_id: Category.fourth.id)
  SubCategory.create(name: "Sandal & Floaters", category_id: Category.fourth.id)

	 100.times do
    product = Product.new
    product.name = Faker::Commerce.product_name
    product.price = Faker::Commerce.price(10,1000)
    product.description = Faker::Lorem.paragraph
    product.stock = Faker::Number.number(3)
    product.cod_eligibility = [true,false].sample
    category = Category.all.sample
    product.category_id = category.id
    product.sub_category_id = category.sub_categories.sample.id
    product.save
  end
end
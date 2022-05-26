# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
json_route = 'db/json_seed/'
categories = JSON.parse(File.read(json_route + 'categories.json'))
categories.each do |category|
  Category.create!(category)
end
tags = JSON.parse(File.read(json_route + 'tags.json'))
tags.each do |tag|
  Tag.create!(tag)
end
books = JSON.parse(File.read(json_route + 'books.json'))
books.each do |book|
  date_formaatted = Date.parse(book["year"].to_s + "-01-01")
  price = rand(10.1..20.1)
  uuid =  SecureRandom.uuid
  active =  rand(0..1)
  category_count = Category.count
  category = rand(1..category_count)
  book_author = book["author"]
  Author.upsert({name: book_author}, unique_by: [:name])
  author = Author.find_by(name: book_author).id
  book_created = Book.create!(code: uuid, name: book["title"], description: book["link"], price: price,  number_of_pages: book["pages"], date_published: date_formaatted, active: active, category_id: category, author_id: author)  
  
  tag_count = Tag.count
  range_tag = (1..tag_count)
  random_tags = rand (range_tag)
  tag = range_tag.to_a.shuffle
  random_tags.times.each do |i|
    BookTag.create!(tag_id: tag[i], book_id: book_created[:id]) 
  end

end



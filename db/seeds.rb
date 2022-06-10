# frozen_string_literal: true

start_time = Time.zone.now
Rails.logger.debug { "Seed started:#{start_time.strftime('%Y-%m-%d %H:%M:%S')}" }
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
json_route = 'db/json_seed/'
categories = JSON.parse(File.read("#{json_route}categories.json"))
categories.each do |category|
  Category.create!(category)
end
tags = JSON.parse(File.read("#{json_route}tags.json"))
tags.each do |tag|
  Tag.create!(tag)
end
books = JSON.parse(File.read("#{json_route}books.json"))
books.each do |book|
  date_formaatted = Date.parse("#{book['year']}-01-01")
  price = rand(10.1..20.1)
  uuid =  SecureRandom.uuid
  active = rand(0..1)
  category_count = Category.count
  category = rand(1..category_count)
  book_author = book['author']
  Author.create!({ name: book_author }) unless Author.find_by(name: book_author)
  author = Author.find_by(name: book_author).id
  book_created = Book.create!(code: uuid, name: book['title'], description: book['link'], price: price,
                              number_of_pages: book['pages'], date_published: date_formaatted, active: active,
                              category_id: category, author_id: author)

  tag_count = Tag.count
  range_tag = (1..tag_count)
  random_tags = rand(range_tag)
  tag = range_tag.to_a.shuffle
  random_tags.times.each do |i|
    BookTag.create!(tag_id: tag[i], book_id: book_created[:id])
  end
end
5.times.each do |i|
  user = User.create!(email: "jhondoe#{i}@example.com", first_name: "Jhon#{i}", last_name: "Doe#{i}",
                      date_of_birth: "2000-01-0#{i + 1}", password: '123456', password_confirmation: '123456')
  Request.create!(name_of_book: "Book#{i}", user_id: user.id)
end
Book.all.each do |book|
  BookComment.create!(message: 'I love this book', approved: true, user_id: 1, book_id: book.id)
end
finish_time = Time.zone.now
duration = finish_time - start_time
Rails.logger.debug { "Seed finished: #{finish_time.strftime('%Y-%m-%d %H:%M:%S')}" }
Rails.logger.debug { "Duration: #{format('%.2f', duration)} Seconds" }
Rails.logger.debug 'Records created:'
Rails.logger.debug [{ Books: Book.count, Authors: Author.count, Categories: Category.count, Tags: Tag.count,
                      BookTags: BookTag.count, Users: User.count, Request: Request.count, Comments: BookComment.count }]

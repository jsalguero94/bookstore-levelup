json.extract! book, :id, :code, :name, :description, :price, :number_of_pages, :date_published, :active, :created_at, :updated_at
json.url book_url(book, format: :json)

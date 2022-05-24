json.extract! request, :id, :name_of_book, :created_at, :updated_at
json.url request_url(request, format: :json)

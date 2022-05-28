json.extract! comment, :id, :message, :approved, :created_at, :updated_at
json.url comment_url(comment, format: :json)

json.extract! book, :id, :title, :abstract, :price, :created_at, :updated_at
json.url book_url(book, format: :json)

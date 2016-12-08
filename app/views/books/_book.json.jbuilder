json.extract! book, :id, :name, :price, :writer, :editorial, :genre, :created_at, :updated_at
json.url book_url(book, format: :json)
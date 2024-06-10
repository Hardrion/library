json.extract! book, :id, :title, :author, :sypnosis, :publication_date, :country, :total_chapters, :created_at, :updated_at
json.url book_url(book, format: :json)

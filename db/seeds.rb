# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end





# db/seeds.rb

Book.create([
  { title: "The Great Adventure", author: "John Smith", sypnosis: "An exhilarating journey through unknown lands.", publication_date: "2020-01-15", country: "USA", total_chapters: 12 },
  { title: "Mystery of the Old House", author: "Jane Doe", sypnosis: "A suspenseful tale of secrets and discoveries.", publication_date: "2018-07-23", country: "UK", total_chapters: 10 },
  { title: "Science of the Universe", author: "Albert Johnson", sypnosis: "Exploring the vast mysteries of the cosmos.", publication_date: "2019-05-10", country: "Germany", total_chapters: 15 },
  { title: "Love and War", author: "Emily Clark", sypnosis: "A romantic story set against the backdrop of conflict.", publication_date: "2021-09-30", country: "France", total_chapters: 8 },
  { title: "The Last Kingdom", author: "Michael Brown", sypnosis: "A gripping saga of power and betrayal.", publication_date: "2017-03-12", country: "Italy", total_chapters: 20 },
  { title: "Journey to the Future", author: "Sarah Davis", sypnosis: "A thrilling adventure into the possibilities of tomorrow.", publication_date: "2023-02-25", country: "Japan", total_chapters: 14 },
  { title: "Cooking with Love", author: "Gordon Ramsay", sypnosis: "Delicious recipes and the stories behind them.", publication_date: "2020-11-17", country: "Australia", total_chapters: 6 },
  { title: "Mysteries of the Ocean", author: "Jacques Cousteau", sypnosis: "Discovering the secrets beneath the waves.", publication_date: "2016-04-20", country: "Canada", total_chapters: 18 },
  { title: "The Art of War", author: "Sun Tzu", sypnosis: "Ancient strategies and tactics for modern life.", publication_date: "2015-06-15", country: "China", total_chapters: 13 },
  { title: "Exploring the Mind", author: "Sigmund Freud", sypnosis: "An in-depth look at human psychology.", publication_date: "2022-08-05", country: "Austria", total_chapters: 11 }
])


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
  { 
    title: "The Great Adventure", 
    author: "John Smith", 
    synopsis: "An exhilarating journey through unknown lands.", 
    publication_date: "2020-01-15", 
    country: "USA", 
    total_chapters: 12 
  },
  { 
    title: "Mystery of the Old House", 
    author: "Jane Doe", 
    synopsis: "A suspenseful tale of secrets and discoveries.", 
    publication_date: "2018-07-23", 
    country: "UK", 
    total_chapters: 10 
  },
  { 
    title: "Science of the Universe", 
    author: "Albert Johnson", 
    synopsis: "Exploring the vast mysteries of the cosmos.", 
    publication_date: "2019-05-10", 
    country: "Germany", 
    total_chapters: 15 
  },
  { 
    title: "Love and War", 
    author: "Emily Clark", 
    synopsis: "A romantic story set against the backdrop of conflict.", 
    publication_date: "2021-09-30", 
    country: "France", 
    total_chapters: 8 
  },
  { 
    title: "The Last Kingdom", 
    author: "Michael Brown", 
    synopsis: "A gripping saga of power and betrayal.", 
    publication_date: "2017-03-12", 
    country: "Italy", 
    total_chapters: 20 
  },
  { 
    title: "Journey to the Future", 
    author: "Sarah Davis", 
    synopsis: "A thrilling adventure into the possibilities of tomorrow.", 
    publication_date: "2023-02-25", 
    country: "Japan", 
    total_chapters: 14 
  },
  { 
    title: "Cooking with Love", 
    author: "Gordon Ramsay", 
    synopsis: "Delicious recipes and the stories behind them.", 
    publication_date: "2020-11-17", 
    country: "Australia", 
    total_chapters: 6 
  },
  { 
    title: "Mysteries of the Ocean", 
    author: "Jacques Cousteau", 
    synopsis: "Discovering the secrets beneath the waves.", 
    publication_date: "2016-04-20", 
    country: "Canada", 
    total_chapters: 18 
  },
  { 
    title: "The Art of War", 
    author: "Sun Tzu", 
    synopsis: "Ancient strategies and tactics for modern life.", 
    publication_date: "2015-06-15", 
    country: "China", 
    total_chapters: 13 
  },
  { 
    title: "Exploring the Mind", 
    author: "Sigmund Freud", 
    synopsis: "An in-depth look at human psychology.", 
    publication_date: "2022-08-05", 
    country: "Austria", 
    total_chapters: 11 
  },
  { 
    title: "The Lost City", 
    author: "Laura Martin", 
    synopsis: "An archaeologist's quest to uncover ancient secrets.", 
    publication_date: "2021-11-22", 
    country: "Mexico", 
    total_chapters: 10 
  },
  { 
    title: "Space Odyssey", 
    author: "Carl Sagan", 
    synopsis: "A visionary exploration of space and time.", 
    publication_date: "2019-12-01", 
    country: "USA", 
    total_chapters: 14 
  },
  { 
    title: "Medieval Mysteries", 
    author: "Richard Harris", 
    synopsis: "Unraveling the enigmas of the medieval era.", 
    publication_date: "2017-08-18", 
    country: "UK", 
    total_chapters: 16 
  },
  { 
    title: "Technological Marvels", 
    author: "Elon Musk", 
    synopsis: "Innovations that are changing our world.", 
    publication_date: "2023-03-15", 
    country: "USA", 
    total_chapters: 12 
  },
  { 
    title: "Culinary Journey", 
    author: "Julia Child", 
    synopsis: "Exploring the world's cuisines through personal stories.", 
    publication_date: "2020-06-30", 
    country: "France", 
    total_chapters: 8 
  },
  { 
    title: "Ancient Civilizations", 
    author: "Howard Carter", 
    synopsis: "Discovering the roots of human history.", 
    publication_date: "2018-02-20", 
    country: "Egypt", 
    total_chapters: 20 
  },
  { 
    title: "Future of Humanity", 
    author: "Michio Kaku", 
    synopsis: "Predicting the future of our species.", 
    publication_date: "2022-05-10", 
    country: "Japan", 
    total_chapters: 10 
  },
  { 
    title: "Adventures in Space", 
    author: "Neil Armstrong", 
    synopsis: "A firsthand account of space exploration.", 
    publication_date: "2015-07-21", 
    country: "USA", 
    total_chapters: 15 
  },
  { 
    title: "Secrets of the Forest", 
    author: "Jane Goodall", 
    synopsis: "Exploring the wonders of wildlife.", 
    publication_date: "2020-09-15", 
    country: "Tanzania", 
    total_chapters: 13 
  },
  { 
    title: "Digital Revolution", 
    author: "Bill Gates", 
    synopsis: "How technology is transforming our lives.", 
    publication_date: "2019-04-25", 
    country: "USA", 
    total_chapters: 11 
  },
  { 
    title: "The Hidden Fortress", 
    author: "Akira Kurosawa", 
    synopsis: "A tale of bravery and strategy in feudal Japan.", 
    publication_date: "2018-12-05", 
    country: "Japan", 
    total_chapters: 9 
  },
  { 
    title: "Voyage to the Deep", 
    author: "James Cameron", 
    synopsis: "An underwater adventure exploring the ocean's depths.", 
    publication_date: "2021-01-19", 
    country: "USA", 
    total_chapters: 12 
  },
  { 
    title: "Echoes of Eternity", 
    author: "H.P. Lovecraft", 
    synopsis: "A collection of chilling tales from beyond.", 
    publication_date: "2017-10-31", 
    country: "USA", 
    total_chapters: 22 
  },
  { 
    title: "Whispers of the Past", 
    author: "Agatha Christie", 
    synopsis: "A series of interconnected mysteries and murders.", 
    publication_date: "2019-08-14", 
    country: "UK", 
    total_chapters: 16 
  },
  { 
    title: "Galactic Frontiers", 
    author: "Isaac Asimov", 
    synopsis: "Exploring the boundaries of space and time.", 
    publication_date: "2020-04-23", 
    country: "Russia", 
    total_chapters: 18 
  }
])

# Create Users
users = User.create([
  { 
    first_name: "John", 
    last_name: "Doe", 
    email: "john.doe@example.com", 
    date_of_birth: "1990-01-01", 
    address: "123 Main St" 
  },
  { 
    first_name: "Jane", 
    last_name: "Smith", 
    email: "jane.smith@example.com", 
    date_of_birth: "1985-05-05", 
    address: "456 Elm St" 
  },
  { 
    first_name: "Alice", 
    last_name: "Johnson", 
    email: "alice.johnson@example.com", 
    date_of_birth: "1992-03-12", 
    address: "789 Pine St" 
  },
  { 
    first_name: "Bob", 
    last_name: "Brown", 
    email: "bob.brown@example.com", 
    date_of_birth: "1988-07-22", 
    address: "321 Oak St" 
  },
  { 
    first_name: "Carol", 
    last_name: "Davis", 
    email: "carol.davis@example.com", 
    date_of_birth: "1995-10-05", 
    address: "654 Maple St" 
  },
  { 
    first_name: "David", 
    last_name: "Evans", 
    email: "david.evans@example.com", 
    date_of_birth: "1980-02-14", 
    address: "987 Birch St" 
  },
  { 
    first_name: "Emma", 
    last_name: "Wilson", 
    email: "emma.wilson@example.com", 
    date_of_birth: "1993-11-30", 
    address: "159 Cedar St" 
  },
  { 
    first_name: "Frank", 
    last_name: "Taylor", 
    email: "frank.taylor@example.com", 
    date_of_birth: "1987-04-21", 
    address: "753 Walnut St" 
  },
  { 
    first_name: "Grace", 
    last_name: "Martin", 
    email: "grace.martin@example.com", 
    date_of_birth: "1991-09-09", 
    address: "246 Spruce St" 
  },
  { 
    first_name: "Henry", 
    last_name: "Walker", 
    email: "henry.walker@example.com", 
    date_of_birth: "1983-06-17", 
    address: "468 Poplar St" 
  }
])

# Create Favorites
favorites = Favorite.create([
  { 
    user: User.second, 
    book: Book.first 
  },
  { 
    user: User.third, 
    book: Book.first 
  },
  { 
    user: User.third, 
    book: Book.second 
  },
  { 
    user: User.fourth, 
    book: Book.first 
  },
  { 
    user: User.fourth, 
    book: Book.second 
  },
  { 
    user: User.fourth, 
    book: Book.third 
  },
  { 
    user: User.fifth, 
    book: Book.first 
  },
  { 
    user: User.fifth, 
    book: Book.second 
  },
  { 
    user: User.fifth, 
    book: Book.third 
  },
  { 
    user: User.fifth, 
    book: Book.fourth 
  }
])

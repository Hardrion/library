class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :date_of_birth, presence: true
  validates :address, presence: true, length: { minimum: 2, maximum: 100 }

  # Associations
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book
end

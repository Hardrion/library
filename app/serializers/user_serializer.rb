class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :date_of_birth, :address
  has_many :favorite_books, through: :favorites, source: :book
end

class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :date_of_birth, presence: true
  validates :address, presence: true, length: { minimum: 2, maximum: 100 }

  validate :date_of_birth_cannot_be_in_the_future

  # Associations
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book

  private

  def date_of_birth_cannot_be_in_the_future
    return unless date_of_birth.present? && date_of_birth > Time.zone.today

    errors.add(:date_of_birth, "can't be in the future")
  end
  
end

class Book < ApplicationRecord
  # Associations
  has_many :favorites, dependent: :destroy
  has_many :users_favorited_by, through: :favorites, source: :user

  #Validations
  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  validates :synopsis, length: { maximum:  250,
                                 too_long: "%<count>s characters is the maximum allowed" }
  validates :country, presence: true, length: { minimum: 2 }
  validates :total_chapters, presence:     true,
                             numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :publication_date, presence: true

  # additional validation
  validate :publication_date_cannot_be_in_the_future
  validate :country_must_start_with_capital_letter

  private

  def publication_date_cannot_be_in_the_future
    return unless publication_date.present? && publication_date > Time.zone.today

    errors.add(:publication_date, "can't be in the future")
  end

  def country_must_start_with_capital_letter
    return unless country.present? && !country.match?(/\A[A-Z]/)

    errors.add(:country, "must start with a capital letter")
  end


end

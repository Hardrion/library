class Book < ApplicationRecord
    validates :title, presence:true, uniqueness: true, length: { minimum: 2 }
    validates :author, presence:true, length: { minimum: 2 }
    validates :sypnosis,length:  { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }
    validates :country, presence:true, length: { minimum: 2 }
    validates :total_chapters, presence:true, numericality: { only_integer: true, greater_than_or_equal_to:0 }
    validates :publication_date,  presence:true

    #additional validation
    validate :publication_date_cannot_be_in_the_future

    private
    def publication_date_cannot_be_in_the_future
        if publication_date.present? && publication_date > Date.today
          errors.add(:publication_date, "can't be in the future")
        end

  def country_must_start_with_capital_letter
    if country.present? && !country.match?(/\A[A-Z]/)
      errors.add(:country, "must start with a capital letter")
    end
  end
end

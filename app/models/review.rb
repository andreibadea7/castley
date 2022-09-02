class Review < ApplicationRecord
  belongs_to :reservation
  validates :rating, numericality: { less_than_or_equal_to: 5 }
end

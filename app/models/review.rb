class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :guest, class_name: "User"
  validates :rating, numericality: { less_than_or_equal_to: 5 }
end

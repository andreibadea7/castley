class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :castle
  has_one :review

  # validates :check_out, comparison: { greater_than: :check_in }
end

class Castle < ApplicationRecord
  geocoded_by :address
  belongs_to :host, class_name: "User"
  has_many :reservations
  after_validation :geocode, if: :will_save_change_to_address?
end

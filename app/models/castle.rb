class Castle < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end

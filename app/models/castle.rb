class Castle < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_or_address,
                  against: %i[name address],
                  using: {
                    tsearch: { prefix: true }
                  }
end

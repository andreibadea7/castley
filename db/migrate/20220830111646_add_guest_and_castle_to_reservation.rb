class AddGuestAndCastleToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :guest, null: false, foreign_key: { to_table: :users }
    add_reference :reservations, :castle, null: false, foreign_key: true
  end
end

class AddNameAndHostIdToCastle < ActiveRecord::Migration[7.0]
  def change
    add_reference :castles, :host, null: false, foreign_key: { to_table: :users }
    add_column :castles, :name, :string
  end
end

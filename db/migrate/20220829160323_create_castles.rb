class CreateCastles < ActiveRecord::Migration[7.0]
  def change
    create_table :castles do |t|
      t.string :address
      t.integer :capacity
      t.boolean :has_internet
      t.boolean :has_butlers
      t.boolean :has_swimming_pool
      t.integer :price
      t.boolean :has_horses

      t.timestamps
    end
  end
end

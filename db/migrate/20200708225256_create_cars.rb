class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :price
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end

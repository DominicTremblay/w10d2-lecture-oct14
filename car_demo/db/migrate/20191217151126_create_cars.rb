class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars, force: true, cascade: true do |t|
      t.references :make, foreign_key: true
      t.references :model, foreign_key: true
      t.integer :year
      t.references :trim, foreign_key: true
      t.references :style, foreign_key: true
      t.string :colour

      t.timestamps
    end
  end
end

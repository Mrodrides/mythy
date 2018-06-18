class CreateCreatures < ActiveRecord::Migration[5.2]
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :address
      t.string :picture
      t.float :price
      t.float :lat
      t.float :long

      t.references :user, foreign_key: true

      t.text :description
      t.text :care
      t.text :diet
      t.boolean :wifi
      t.boolean :fly
      t.boolean :mount
      t.boolean :dangerous
      t.boolean :shitty
      t.boolean :domestic

      t.timestamps
    end
  end
end

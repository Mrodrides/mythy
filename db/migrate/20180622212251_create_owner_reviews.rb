class CreateOwnerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_reviews do |t|
      t.integer :creature_rating
      t.integer :owner_rating
      t.string :comment
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end

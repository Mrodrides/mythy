class CreateBookerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :booker_reviews do |t|
      t.integer :rating
      t.string :comment
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end

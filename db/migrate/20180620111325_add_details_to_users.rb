class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :lat, :float
    add_column :users, :long, :float
    add_column :users, :picture, :string
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
  end
end

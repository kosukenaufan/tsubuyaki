class AddDetailsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :genre, :string
    add_column :posts, :location, :string
    add_column :posts, :price, :string
    add_column :posts, :link, :string
  end
end

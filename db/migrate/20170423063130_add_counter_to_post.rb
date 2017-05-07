class AddCounterToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :counter, :integer, default: @@count = 0
  end
end

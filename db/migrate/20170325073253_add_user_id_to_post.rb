class AddUserIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user_id, foreign_key: true
  end
end

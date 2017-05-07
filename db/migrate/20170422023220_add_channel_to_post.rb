class AddChannelToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :channel, :string
  end
end

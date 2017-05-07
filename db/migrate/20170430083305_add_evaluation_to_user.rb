class AddEvaluationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :evaluation, :boolean
  end
end

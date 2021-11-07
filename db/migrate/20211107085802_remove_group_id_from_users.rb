class RemoveGroupIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :group, foreign_key: true, null: true
  end
end

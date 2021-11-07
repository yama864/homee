class AddGroupIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :group, foreign_key: true, null: false
  end
end

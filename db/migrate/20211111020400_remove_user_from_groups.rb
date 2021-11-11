class RemoveUserFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_reference :groups, :user, foreign_key: true, null: false
  end
end

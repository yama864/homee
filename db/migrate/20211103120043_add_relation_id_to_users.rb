class AddRelationIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :relation_id, :integer
  end
end

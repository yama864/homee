class ChangeColumnsAddNotnullOnEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :title, :string, null: false
  end
end

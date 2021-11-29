class RenameStatusColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :status, :person
  end
end

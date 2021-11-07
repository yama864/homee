class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_name,       null:false
      t.string :password_digest,  null: false, default: ""
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end

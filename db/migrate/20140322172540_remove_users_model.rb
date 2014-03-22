class RemoveUsersModel < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end

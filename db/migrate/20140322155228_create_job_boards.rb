class CreateJobBoards < ActiveRecord::Migration
  def change
    create_table :job_boards do |t|
      t.string :title, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :employer
      t.integer :hours_per_week
      t.string :location
      t.string :employment
      t.string :job_posting_url
      t.string :local_url
      t.string :employer_portal
      t.string :portal_login
      t.string :date_applied
      t.string :status, null: false
      t.string :referred_by
      t.string :reminder
      t.integer :user_id
      t.integer :job_board_id

      t.timestamps
    end

    add_index :posts, :job_posting_url, unique: true
  end
end

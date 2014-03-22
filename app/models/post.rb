class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :status, presence: true
  belongs_to :user
  belongs_to :job_board
end

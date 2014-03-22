class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :status, presence: true
  validates :job_posting_url, uniqueness: true
  belongs_to :user
  belongs_to :job_board
end

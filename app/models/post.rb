class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :status, presence: true
  validates :job_posting_url, uniqueness: { scope: :user_id }
  belongs_to :user
  validates :user, presence: true
  belongs_to :job_board

  def http_fetch(url)
    resp = Net::HTTP.get_response(URI.parse(url))
    resp.body
  end

end

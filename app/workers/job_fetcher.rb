require 'sidekiq/testing/inline'
require 'net/http'
class JobFetcher
  include Sidekiq::Worker

  def perform(post_id)
    post = Post.find(post_id)
    if post.job_posting_url != ""
      resp = Net::HTTP.get_response(URI.parse(post.job_posting_url))
      post.update_attributes website_content: resp.body
      post.save
    end
  end
end

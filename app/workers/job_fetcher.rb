require 'sidekiq/testing/inline'
class JobFetcher
  include Sidekiq::Worker

  def perform(post_id)
    binding.pry
    post = Post.find(post_id)
    resp = Net::HTTP.get_response(URI.parse(post.job_posting_url))
    post.update_attributes website_content: resp.body
    post.save
  end
end

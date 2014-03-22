class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show

  end

  def edit

  end

  def new
    @post = current_user.posts.build
  end

  def create
    source = params[:post][:job_posting_url]
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    @post = current_user.posts.build(params[:post].permit!)
    @post.update_attributes website_content: data
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @post.update(params[:post].permit!)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title)
  end

end

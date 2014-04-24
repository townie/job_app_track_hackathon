require 'net/http'
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:post][:job_posting_url] != ""
      data = @post.http_fetch(params[:post][:job_posting_url])
      data = data.force_encoding('Windows-1252').encode('UTF-8')
      @post.update_attributes website_content: data
    end
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if (@post.website_content != params[:website_content]) && params[:post][:job_posting_url] != ""
      data = @post.http_fetch(params[:post][:job_posting_url])
      data = data.force_encoding('Windows-1252').encode('UTF-8')
      @post.update_attributes website_content: data
    end
    if @post.update(post_params)
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
    params.require(:post).permit(:title, :employer, :hours_per_week, :location, :employment, :job_posting_url, :local_url, :employer_portal, :date_applied, :status, :referred_by, :reminder)
  end

end

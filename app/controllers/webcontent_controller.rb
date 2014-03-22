class WebcontentController < ApplicationController
  def show
    @content = Post.find(params[:id])
  end
end

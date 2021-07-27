class PostsController < ApplicationController
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @posts = Post.all
    render json: @posts
  end
end

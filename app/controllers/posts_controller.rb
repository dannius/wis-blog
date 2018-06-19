class PostsController < ApplicationController
  layout "simple", only: [:index]

  def index
    @posts = Post.where(user_id: params[:user_id]).last(5).reverse()
  end

  def create
    draft_params = post_params
    draft_params["user_id"] = current_user.id
    @post = Post.create(draft_params)

    if @post.invalid?
      render status: 422
    end
  end

  def show
    @post = Post.find_by_id([params[:id]])
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end
end

class CommentsController < ApplicationController

  def create
    draft_params = comment_params
    draft_params["post_id"] = params[:post_id]

    if user_signed_in?
      draft_params["user_id"] = current_user.id
    end

    @comment = Comment.create(draft_params)

    if @comment.invalid?
      render status: 422
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end

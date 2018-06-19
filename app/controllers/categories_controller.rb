class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: params[:user_id])
  end

  def create
    draft_params = category_params
    draft_params["user_id"] = current_user.id
    @category = Category.create(draft_params)

    if @category.invalid?
      render status: 422
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])

    if @category.destroy
      @category
    else
      render status: 422
    end
  end

  private
    def category_params
      params.require(:category).permit(:title)
    end
end

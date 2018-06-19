class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: params[:user_id])
  end
end

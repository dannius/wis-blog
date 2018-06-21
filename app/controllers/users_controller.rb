class UsersController < ApplicationController
  layout "simple", only: [:index]

  def index
    current_user_id = (current_user.present?) ? current_user.id : -1
    @users = User.where("id != #{current_user_id}")
  end

  def show
    @selected_user = User.find_by_id([params[:id]])

    @selected_user = {
      id: (@selected_user.present?) ? @selected_user.id : nil,
      email: (@selected_user.present?) ? @selected_user.email : nil
    }

    @signed_in_user = {
      id: (user_signed_in?)? current_user.id : nil,
      email: (user_signed_in?)? current_user.email : nil
    }
  end

  def update
    @user = User.find_by_id(params[:id])
    puts photo_params
  end

  private
    def photo_params
      params.require(:user).permit(:photo)
    end
end

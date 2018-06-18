class AccountController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to users_path
    end      
  end

  def signed_in_user
    render json: 'kek'
  end
end

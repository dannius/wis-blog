class AccountController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to users_path
    else
      redirect_to user_path(current_user)
    end     
  end
end

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now[:alert] = 'Unregistered User!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to categories_url, notice: "You're now signed out!"
  end
end

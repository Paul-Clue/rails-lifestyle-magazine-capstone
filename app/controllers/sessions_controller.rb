class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'

    end
  end

  def destroy
    # User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/users/new'
  end

  def page_requires_login; end

  def login; end
end

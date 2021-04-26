class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  # def tesla
  #   @tesla = Article.all.tesla
  # end

  # def ford
  #   @ford = Article.all.ford
  # end

  # def gm
  #   @gm = Article.all.gm
  # end

  # def lucid
  #   @lucid = Article.all.lucid
  # end

  # def battery
  #   @battery = Article.all.battery
  # end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_article
    Article.find_by(id: params[:id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
 end
end

class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]
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

  def welcome
    @art = Article.all

    @arr = []
    @votes = Vote.all
    @votes.each do |vote|
      @arr << vote.article.id
    end
    @most_popular_article = @arr.max_by { |i| @arr.count(i) }
    @most_popular_article2 = Article.where('(id = ?)', @most_popular_article).first

    @recent_tesla_article = Article.where('(category_id = ?)', 1).order('created_at').last
    @recent_ford_article = Article.where('(category_id = ?)', 2).order('created_at').last
    @recent_gm_article = Article.where('(category_id = ?)', 3).order('created_at').last
    @recent_lucid_article = Article.where('(category_id = ?)', 4).order('created_at').last
  end
end

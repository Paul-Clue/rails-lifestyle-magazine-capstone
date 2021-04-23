class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end

#   def create
#     @user = User.find_by(username: params[:username])
#     if @user && @user.authenticate(params[:password])
#        sessions[:user_id] = @user.id
#        redirect_to '/welcome'
#     else
#        redirect_to '/login'
#     end
#  end

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
    redirect_to '/login'
  end

  def page_requires_login
  end

  def login
  end

  def welcome
    if !Article.exists?
      @recent_tesla_article = Article.create(:title => 'Tesla', :text => "Tesla news", :image => nil, :user_id => current_user.id, :category_id => 1)
      @recent_ford_article = Article.create(:title => 'Ford', :text => "Ford news", :image => nil, :user_id => current_user.id, :category_id => 2)
      @recent_gm_article = Article.create(:title => 'GM', :text => "GM news", :image => nil, :user_id => current_user.id, :category_id => 3)
      @recent_lucid_article = Article.create(:title => 'Lucid', :text => "Lucid news", :image => nil, :user_id => current_user.id, :category_id => 4)
      @recent_battery_article = Article.create(:title => 'Battery-Tech', :text => "Battery news", :image => nil, :user_id => current_user.id, :category_id => 5)
      @articles = Article.all
    elsif Article.where(:category_id => 1..5 )
      @recent_tesla_article = Article.where('(category_id = ?)', 1).first
      @recent_ford_article = Article.where('(category_id = ?)', 2).first
      @recent_gm_article = Article.where('(category_id = ?)', 3).first
      @recent_lucid_article = Article.where('(category_id = ?)', 4).first
      @recent_battery_article = Article.where('(category_id = ?)', 5).first
      @articles = Article.all
    elsif Article.where(:category_id => 1..4 )
      @recent_tesla_article = Article.where('(category_id = ?)', 1).first
      @recent_ford_article = Article.where('(category_id = ?)', 2).first
      @recent_gm_article = Article.where('(category_id = ?)', 3).first
      @recent_lucid_article = Article.where('(category_id = ?)', 4).first
      @recent_battery_article = Article.create(:title => 'Battery-Tech', :text => "Battery news", :image => nil, :user_id => current_user.id, :category_id => 5)  
      @articles = Article.all
    elsif Article.where(:category_id => 1..3 )
      @recent_tesla_article = Article.where('(category_id = ?)', 1).first
      @recent_ford_article = Article.where('(category_id = ?)', 2).first
      @recent_gm_article = Article.where('(category_id = ?)', 3).first
      @recent_lucid_article = Article.create(:title => 'Lucid', :text => "Lucid news", :image => nil, :user_id => current_user.id, :category_id => 4)
      @recent_battery_article = Article.create(:title => 'Battery-Tech', :text => "Battery news", :image => nil, :user_id => current_user.id, :category_id => 5)
      @articles = Article.all
    elsif Article.where(:category_id => 1..2 )
      @recent_tesla_article = Article.where('(category_id = ?)', 1).first
      @recent_ford_article = Article.where('(category_id = ?)', 2).first
      @recent_gm_article = Article.create(:title => 'GM', :text => "GM news", :image => nil, :user_id => current_user.id, :category_id => 3)
      @recent_lucid_article = Article.create(:title => 'Lucid', :text => "Lucid news", :image => nil, :user_id => current_user.id, :category_id => 4)
      @recent_battery_article = Article.create(:title => 'Battery-Tech', :text => "Battery news", :image => nil, :user_id => current_user.id, :category_id => 5)
      @articles = Article.all
    else
      @recent_tesla_article = Article.where('(category_id = ?)', 1).first
      @recent_ford_article = Article.where('(category_id = ?)', 2).first
      @recent_gm_article = Article.where('(category_id = ?)', 3).first
      @recent_lucid_article = Article.where('(category_id = ?)', 4).first
      @recent_battery_article = Article.where('(category_id = ?)', 5).first
      @articles = Article.all
    end


    if Vote
      @arr = []
      @votes = Vote.all
      @votes.each do |vote|
        @arr << vote.article.id
      end
      @most_popular_article = @arr.max_by {|i| @arr.count(i)}
      @most_popular_article2 = Article.where('(id = ?)', @most_popular_article).first
    else
      @most_popular_article2 = Article.where('(user_id = ?)', current_user.id).first
    end
  end
end

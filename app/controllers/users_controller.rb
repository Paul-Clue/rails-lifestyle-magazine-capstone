class UsersController < ApplicationController
  include ActiveModel::Validations
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :authorized, only: %i[new create]
  validates :user_name, presence: true

  def index
    @users = User.all
    @user = User.new
  end

  def profile
    @user_articles = Article.where(user_id: current_user.id)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.create(params.require(:user).permit(:user_name))

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to '/welcome', notice: 'WELCOME' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name)
  end

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end

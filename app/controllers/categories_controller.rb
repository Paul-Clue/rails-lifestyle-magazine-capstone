class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  def index; end

  def show
    @article = Category.show(params[:id])
    @author = User.all
  end

  def new; end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  def index
  end
  
  def show
    @cat_id = Article.find(params[:id]).category_id
    @article = Article.where('(category_id = ?)', @cat_id)
    @author = User.all
  end

  def new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @categpry = Category.find(Article.find(6).category_id)
  end

end

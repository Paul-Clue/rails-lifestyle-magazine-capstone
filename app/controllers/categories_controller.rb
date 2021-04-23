class CategoriesController < ApplicationController
  def show
    @article = Article.where(:category_id => params[:id])
  end
end

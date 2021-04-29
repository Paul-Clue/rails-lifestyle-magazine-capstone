class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index; end

 
  def show; end

 
  def new
    @article = Article.new
  end

  def welcome
    @recent_tesla_article = Article.all.tesla.first
    @recent_ford_article = Article.all.ford.first
    @recent_gm_article = Article.all.gm.first
    @recent_lucid_article = Article.all.lucid.first
    @most_popular_article2 = Article.most_pop

    @art = Article.all
  end

 
  def edit
    @article.image.attach(params[:image])
  end


  def create
    @article = Article.new(article_params)
    @article2 = Article.all

    respond_to do |format|
      if @article.save
        format.html { redirect_to welcome_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  
  def set_article
    @article = Article.find(params[:id])
  end

  
  def article_params
    params.require(:article).permit(:title, :text, :image, :user_id, :category_id)
  end
end

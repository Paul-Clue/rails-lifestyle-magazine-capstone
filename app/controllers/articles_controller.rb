class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  # before_action :authenticate_user!, except: [:index]

  # GET /articles or /articles.json
  def index; end

  # GET /articles/1 or /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article.image.attach(params[:image])
  end

  # POST /articles or /articles.json
  def create
    unless Category.exists?
      @tes = Category.create(name: 'tesla', priority: 1)
      @for = Category.create(name: 'ford', priority: 2)
      @gem = Category.create(name: 'gm', priority: 3)
      @luc = Category.create(name: 'lucid', priority: 4)
      @bat = Category.create(name: 'battery', priority: 5)
    end
    @article = Article.new(article_params)
    @article2 = Article.all

    # if @article2.length.between?(1, 15)
    #   @most_popular_article2 = Article.create(:title => 'Tesla', :text => "Tesla news", :image => params[:image], :user_id => current_user.id, :category_id => 1)
    #   @recent_tesla_article = Article.create(:title => 'Tesla', :text => "Tesla news", :image => params[:image], :user_id => current_user.id, :category_id => 1)
    #   @recent_ford_article = Article.create(:title => 'Ford', :text => "Ford news", :image =>  params[:image], :user_id => current_user.id, :category_id => 2)
    #   @recent_gm_article = Article.create(:title => 'GM', :text => "GM news", :image =>  params[:image], :user_id => current_user.id, :category_id => 3)
    #   @recent_lucid_article = Article.create(:title => 'Lucid', :text => "Lucid news", :image =>  params[:image], :user_id => current_user.id, :category_id => 4)
    #   @recent_battery_article = Article.create(:title => 'Battery-Tech', :text => "Battery news", :image => params[:image], :user_id => current_user.id, :category_id => 5)
    #   @articles = Article.all
    # end

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

  # PATCH/PUT /articles/1 or /articles/1.json
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

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, :user_id, :category_id)
  end
end

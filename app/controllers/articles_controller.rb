class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!, except: [:index]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    @recent_tesla_article = Article.all.tesla.first
    @recent_ford_article = Article.all.ford.first
    @recent_gm_article = Article.all.gm.first
    @recent_lucid_article = Article.all.lucid.first
    @recent_battery_article = Article.all.battery.first
    @most_popular_article = Vote.popular_article
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

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
    # ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaStatements#reset_pk_sequence!
    # Category.delete_all
    if !Category.exists?
      @tes = Category.create(:name =>"tesla", :priority => 1)
      @for = Category.create(:name =>"ford", :priority => 2)
      @gem = Category.create(:name =>"gm", :priority => 3)
      @luc = Category.create(:name =>"lucid", :priority => 4)
      @bat = Category.create(:name =>"battery", :priority => 5)
    end
    @article = Article.new(article_params)

    @artid = @article.id
    @link = Link.create(link_params)
   
    # @link.article_id = @artid
    # @cat = Category.where('(name = ?)', 'tesla').first
    # @link.category_id = @cat.id
    # Link.create(:category_id => cate, :article_id => "2")

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
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
        format.html { redirect_to @article, notice: "Article was successfully updated." }
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
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
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

    def link_params
      params.permit(:article_id, :category_id)
    end
end

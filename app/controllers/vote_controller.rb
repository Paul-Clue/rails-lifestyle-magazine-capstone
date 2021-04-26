class VoteController < ApplicationController
  def index
  end
  def create
    @vote = Vote.new(:user_id => current_user.id)
    @vote.article_id = params[:article_id]
    respond_to do |format|
      if @vote.save
        format.html { redirect_to category_path(params[:id]), notice: "Vote was successfully cast." }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.permit(:user_id, :article_id)
    end
end

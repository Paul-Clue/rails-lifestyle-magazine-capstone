module CategoriesHelper
  def us_name

    @user = []
    @article = Article.where(:category_id => params[:id])
    @article.each do |art|
      @user = User.where(:id => art.user_id)
      break
    end

    @used = '' 
    @article.each do |item|
      @user.each do |use|
        if use.id == item.user_id
          @used +=  "<p style='color: white;'>#{use.user_name} </p>"
          break
        end
      end
    end

    @used.html_safe
  end
end

module CategoriesHelper
  def us_name(id)
    @cat_id = Article.find(params[:id]).category_id
    @article3 = Article.where('(category_id = ?)', @cat_id)
    @user = User.find(id).user_name
    @user2 = "#{@user}"

    return @user2.html_safe
  end
end

module CategoriesHelper
  def us_name(id)
    @cat_id = Article.find(params[:id]).category_id
    @article3 = Article.where('(category_id = ?)', @cat_id)
    @user = User.find(id).user_name
    @user2 = @user.to_s

    @user2.html_safe
  end

  def form2_0(vto, id)
    if !Vote.where('(user_id = ? and article_id = ?)', current_user.id, id).first
      render partial: "form3", locals: { vto: vto, id: id }
    end
     
  end
end


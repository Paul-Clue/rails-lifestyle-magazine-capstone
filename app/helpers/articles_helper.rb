module ArticlesHelper
  def display_image
    @img = ''
    if @article.image.attached?
      @img += "<img src=#{url_for(@article.image)} width='300' >"
      @img.html_safe
    end
  end

  def votes
    @vte =''
    if !Vote.where('(user_id = ? and article_id = ?)', current_user.id, 1).first
      @vte += "<%= form_with(model: vote) do |form| %>"
        @vte += "<div class='field'>"
        @vte += "<%= form.hidden_field :user_id, :value => current_user.id %>"
        @vte += "</div>"
        @vte += "<div class='field'>"
        @vte += "<%= form.hidden_field :article_id, :value => current_article.id %>"
        @vte += "</div>"
        @vte += "<div class='actions'>"
        @vte += "<%= form.submit 'Vote for Article'%>"
        @vte += "</div>"
        @vte += "<% end %>"
        @vte += "<strong>This</strong>"
        @vte.html_safe
    end
  end
end

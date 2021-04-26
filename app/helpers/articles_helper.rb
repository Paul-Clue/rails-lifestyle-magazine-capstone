module ArticlesHelper
  def display_image
    @img = ''
    if @article.image.attached?
      @img += "<div style='z-index: 0; display: flex; justify-content: center;'>"
      @img += "<img src=#{url_for(@article.image)} style='width: 20%; z-index: 0;'>"
      @img += '</div>'
      @img.html_safe
    end
  end
end

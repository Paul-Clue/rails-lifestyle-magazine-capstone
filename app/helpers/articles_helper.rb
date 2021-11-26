module ArticlesHelper
  def tse(art)
    @pet_e = ''
    if art.errors.any?
      @pet_e += "<div id='error_explanation'>"
      @pet_e += "    <h2><%= pluralize(article.errors.count, 'error') %> prohibited this article from being saved:</h2>"

      @pet_e += '    <ul>'
      @pet_e += '       <%=article.errors.each do |error|%>'
      @pet_e += '        <li><%= error.full_message</li>'
      @pet_e += '      <%= end %>'
      @pet_e += '    </ul>'
      @pet_e += '</div>'
    end
    @pet_e.html_safe
  end
end

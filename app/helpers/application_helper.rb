module ApplicationHelper
  def logout_button
    @recent_tesla_article = Article.all.tesla.first
    @recent_ford_article = Article.all.ford.first
    @recent_gm_article = Article.all.gm.first
    @recent_lucid_article = Article.all.lucid.first
    @most_popular_article2 = Article.most_pop

    tes_id = @recent_tesla_article
    for_id = @recent_ford_article 
    gm_id = @recent_gm_article
    luc_id = @recent_lucid_article
    pop = @most_popular_article2
    @str = ''
    if logged_in?
      @str += "<li class='nav-item'>"
      @str += link_to 'Home', welcome_path, style: 'color: orange; text-decoration: none;'.to_s
      @str += '</li>'
      @str += "  <li class='nav-item'>"
      @str += "  #{link_to 'Write An Article', new_article_path, style: 'color: grey; text-decoration: none;',
                                                                 class: 'css_class'}"
      @str += '</li>'
      @str += "<li class='nav-item'>"
      @str += link_to 'Tesla', category_path(tes_id), style: 'color: grey; text-decoration: none;'.to_s
      @str += '</li>'
      @str += "<li class='nav-item'>"
      @str += link_to 'Ford', category_path(ford_id), style: 'color: grey; text-decoration: none;'.to_s
      @str += '</li>'
      @str += "<li class='nav-item'>"
      @str += link_to 'GM', category_path(gm_id), style: 'color: grey; text-decoration: none;'.to_s
      @str += '</li>'
      @str += "<li class='nav-item'>"
      @str += link_to 'Lucid', category_path(luc_id), style: 'color: grey; text-decoration: none;'.to_s
      @str += '</li>'
      @str += "&nbsp;"
      @str += "&nbsp;"
      @str += "&nbsp;"
      @str += "&nbsp;"
      @str += "&nbsp;"
      @str += "&nbsp;"
      @str += " <li class='nav-item'>"
      @str += "  #{link_to('LogOut', '/logout', method: :get, style: 'color: grey; text-decoration: none;')}"
      @str += '</li>'
    else
      @str += "<li class='nav-item'>"
      @str += "  <span style='color: grey; font-size: 18px; font-weight: bold;'>Login or Sign Up:<span>"
      @str += '</li>'
      @str += "<li class='nav-item'>"
      @str += "  #{link_to('Login', '/login', method: :get, style: 'color: navy; text-decoration: none;')}"
      @str += '</li>'
      @str += "<li class='nav-item'>"
      @str += "  #{link_to('Sign Up', '/users/new', method: :get, style: 'color: navy; text-decoration: none;')}"
      @str += '</li>'
    end
    @str.html_safe
  end
end

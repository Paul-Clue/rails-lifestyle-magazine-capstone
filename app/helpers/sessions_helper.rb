module SessionsHelper
  def logout_button
    @str = ''
    if logged_in?
      @str += "<li class='nav-item'>"
      @str += link_to 'Home', welcome_path, style: 'color: orange; text-decoration: none;'.to_s
      @str += '</li>'
      @str += "  <li class='nav-item'>"
      @str += "  #{link_to 'Write An Article', new_article_path, style: 'color: grey; text-decoration: none;',
                                                                 class: 'css_class'}"
      @str += '</li>'
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

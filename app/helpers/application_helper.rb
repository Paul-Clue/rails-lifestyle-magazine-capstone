module ApplicationHelper
  def logout_button
    @str = ''
    if logged_in?
      <li class="nav-item">
          <%= link_to 'Home', welcome_path, style: 'color: orange; text-decoration: none;'%>
      </li>
        <li class="nav-item">
        <%= link_to 'Write An Article', new_article_path, style: 'color: grey; text-decoration: none;', class: "css_class"%>
          
      </li>
        </li>



      @str =+ "<div style='z-index: 2; position: absolute'>"
      @str += link_to("LogOut", '/logout', method: :get, style: 'color: grey; text-decoration: none;')
      @str += '</div>'
      @str.html_safe
    else
      @str += "<h1>Login or Sign Up</h1>"
      @str += button_to "Login", '/login', method: :get
      @str += button_to "Sign Up", '/users/new', method: :get
      @str.html_safe
    end
  end
end

module SessionsHelper
  def logout_button
    @str = ''
    if logged_in?
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

  def pic
  @pic = ''
  @pic += "<div style='background-image: url(#{url_for(@articles.first.image)})';>"
  end
end

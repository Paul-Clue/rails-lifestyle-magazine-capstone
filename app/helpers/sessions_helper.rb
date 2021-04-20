module SessionsHelper
  def logout_button
    @str = ''
    if logged_in?
      @str += "<h1>You are Logged In, #{current_user.user_name}</h1>"
      @str += button_to("LogOut", '/logout', method: :get)
      @str.html_safe
    else
      @str += "<h1>Login or Sign Up</h1>"
      @str += button_to "Login", '/login', method: :get
      @str += button_to "Sign Up", '/users/new', method: :get
      @str.html_safe
    end
  end
end

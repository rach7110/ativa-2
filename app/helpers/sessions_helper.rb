module SessionsHelper
  def is_signed_in?
    !session[:remember_token].nil? and User.find(session[:remember_token])
  end

  def current_user
    User.find(session[:remember_token])
  end
end

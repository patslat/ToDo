module ApplicationHelper

  def current_user
    if session[:token]
      @current_user ||= User.find_by_session_token(session[:token])
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorize_user
    redirect_to login_url unless logged_in?
  end
end

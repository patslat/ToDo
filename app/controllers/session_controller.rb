class SessionController < ApplicationController
  before_filter :authorize_user, :only => :destroy
  def create
    @user = User.find_by_name(params[:name])
    if @user.authenticate_password(params[:password])
      session[:token] = @user.reset_session_token
      @user.save
      redirect_to home_url
    else
      render :new
    end
  end

  def destroy
    user = current_user
    user.session_token = nil
    session[:token] = nil
    user.save
    redirect_to newspapers_url
  end
end

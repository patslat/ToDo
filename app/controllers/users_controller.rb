class UsersController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def create
    @user = User.new(params[:user])
    @user.reset_session_token
    if @user.save
      session[:token] = @user.session_token
      redirect_to home_url
    else
      render :new
    end
  end

end

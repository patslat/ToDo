class TeamsController < ApplicationController
  before_filter :authorize_user
  def show
    @team = Team.where(id: params[:id]).includes(:teammates).first
  end

  def new
    @users = User.all
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to team_url(@team)
    else
      render :new
    end
  end
end

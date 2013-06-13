class TeamsController < ApplicationController
  def show
    @team = Team.where(id: params[:id]).includes(:members).first
  end
end

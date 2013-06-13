class ProjectsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @project = @team.projects.build
    5.times { @project.items.build }
  end

  def create
    @team = Team.find(params[:team_id])
    @project = @team.projects.build(params[:project])
    if @team.save #will this work?
      redirect_to team_projects_url(@team)
    else
      render :new
    end
  end
end

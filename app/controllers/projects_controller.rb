class ProjectsController < ApplicationController
  before_filter :authorize_user
  def index
    @team = Team.find(params[:team_id])
    @projects = @team.projects
  end

  def show
    @project = current_user.projects
                           .where(id: params[:id])
                           .includes(:items)
                           .first
  end

  def new
    if params[:team_id]
      @teams = [current_user.teams.find(params[:team_id])]
    else
      @teams = current_user.teams
    end
    @project = Project.new
    5.times { @project.items.build }
  end

  def create
    @team = Team.find(params[:project][:team_id])
    @project = @team.projects.build(params[:project])
    if @team.save #will this work?
      redirect_to team_project_items_url(@team, @project)
    else
      render :new
    end
  end
end

class ItemsController < ApplicationController
  before_filter :authorize_user

  def index
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
  end

  def show
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def check
    @item = Item.find(params[:item_id])
    @item.completion = @item.completion ? false : true
    @item.save
    redirect_to team_project_items_url
  end
end

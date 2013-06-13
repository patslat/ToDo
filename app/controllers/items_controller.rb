class ItemsController < ApplicationController
  before_filter :authorize_user
  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to projects_url
    else
      render :new
    end
  end
end

class OpenItemsController < ApplicationController

  def new
    @open_item = OpenItem.new
  end

  def create
    @open_item = OpenItem.new(params[:open_item])
    if @open_item.save
      redirect_to jobs_path
    else
      render action: "new"
    end
  end

end
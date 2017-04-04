class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links || ''
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      redirect_to links_path
    else
      flash[:error] = link.errors.full_messages
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      @link.save
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages
      redirect_to edit_link_path(@link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end

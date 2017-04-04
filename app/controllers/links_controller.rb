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

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end

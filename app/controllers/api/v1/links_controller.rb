class Api::V1::LinksController < ApplicationController

  def index
    links = Link.current_hotlinks
    render json: links.to_json
  end

  def show
    response = 'Hello World!'
    render json: response.to_json
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      @link.read_count += params[:count].to_i
      @link.save
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read, :read_count)
  end
end

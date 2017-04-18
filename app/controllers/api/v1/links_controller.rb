class Api::V1::LinksController < ApplicationController

  def index
    Link.all.each do |link|
      hot_read = HotRead.find_or_create_by(url: link.url)
      hot_read.count += link.read_count
      hot_read.save
    end
    hot_reads = HotRead.current_hotreads
    render json: hot_reads.to_json
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
    params.permit(:read)
  end
end

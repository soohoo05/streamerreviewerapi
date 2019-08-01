class PhotosController < ApplicationController
  def create
    @streamer=Streamer.find(params[:streamer_id])
    @streamer.photos.create(streamer_id:params[:streamer_id],picture:params["image"])
    render json:@streamer.photos.last
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end
end

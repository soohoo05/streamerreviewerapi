class StreamersController < ApplicationController

  def create
    if !params["streamer"]["url"].include?("https://") && !params["streamer"]["url"].include?("http://")
      params["streamer"]["url"]="https://"+params["streamer"]["url"]
    end
    @streamer =Streamer.create(streamer_params)
    if @streamer.valid?
      render json: @streamer
    else
      render json: {error:"Cannot process"},status:422
  end
end

  def index
    @streamers=Streamer.all
    render json: @streamers
  end



  def show
    @streamer=Streamer.find_by(username:params[:id])
    @reviews=@streamer.reviews
    newReviews=[]
    @reviews.each do |review|
      element={}
      element["descripton"]=review.description
      element["rating"]=review.rating
      element["author"]=review.user.username
      newReviews.push(element)
    end
    @picture=@streamer.photos.first
    render json: {streamer:@streamer,reviews:@reviews,picture:@picture}
  end


  private

    def streamer_params
      params.require(:streamer).permit(:username,:url,:category)
    end
end

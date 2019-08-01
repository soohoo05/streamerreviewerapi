class ReviewsController < ApplicationController
  def create
    @streamer=Streamer.find(params[:streamer_id])
    @user=User.find(params[:user_id])
    @streamer.reviews.create(review_params.merge(user:@user))
    render json: @streamer.reviews.last
  end

  private

  def review_params
    params.require(:review).permit(:description,:rating,:user_id)
  end
end

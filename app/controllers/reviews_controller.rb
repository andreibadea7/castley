class ReviewsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @review.guest = current_user
    @review.reservation = @reservation
    if @review.save
      redirect_to castle_path(@reservation.castle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

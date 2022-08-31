class ReservationsController < ApplicationController
  def new
    @castle = Castle.find(params[:castle_id])
    @reservation = Reservation.new
  end

  def create
    @castle = Castle.find(params[:castle_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.total_price = ((@reservation.check_out - @reservation.check_in).to_i * @castle.price)
    @reservation.guest = current_user
    @reservation.castle = @castle
    if @reservation.save
      redirect_to my_profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end
end

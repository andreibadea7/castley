class UsersController < ApplicationController
  def show
    @user = current_user
    @my_reservations = Reservation.where(guest: current_user)
  end
end

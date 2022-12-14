class CastlesController < ApplicationController
  def home_page
    @castles = Castle.all
  end

  def index
    if params[:query].present?
      @castles = Castle.search_by_name_or_address(params[:query])
    else
      @castles = Castle.all
    end

    # The `geocoded` scope filters only flats with coordinates
    @markers = @castles.geocoded.map do |castle|
      {
        lat: castle.latitude,
        lng: castle.longitude,
        info_window: render_to_string(partial: "info_window", locals: { castle: castle })
      }
    end
  end

  def show
    @castle = Castle.find(params[:id])
    @reservation = Reservation.new
    @markers = [{
        lat: @castle.latitude,
        lng: @castle.longitude
      }]
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.new(castle_params)
    @castle.host = current_user
    if @castle.save
      redirect_to castle_path(@castle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :address, :price, :capacity, :has_internet, :has_swimming_pool,
                                   :has_butlers, :has_horses, :photo)
  end
end

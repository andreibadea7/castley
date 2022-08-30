class CastlesController < ApplicationController
  def home_page
    @castles = Castle.all
  end

  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.create(castle_params)
    if @castle.save
      redirect_path(@castles)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :address, :price, :capacity, :has_internet, :has_swimming_pool,
                                   :has_butlers, :has_horses)
  end
end

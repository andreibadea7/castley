class CastlesController < ApplicationController
  def index
    @castle = Castle.all
  end
end

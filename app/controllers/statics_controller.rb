class StaticsController < ApplicationController
  def index
    @pelicula = Pelicula.all
  end

  def show
    @pelicula = Pelicula.find(params[:id])
  end

  def about
  end
end

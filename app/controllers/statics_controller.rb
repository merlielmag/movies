class StaticsController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @pelicula = Pelicula.all
  end

  def show
    @pelicula = Pelicula.find(params[:id])
  end

  def about
  end
end

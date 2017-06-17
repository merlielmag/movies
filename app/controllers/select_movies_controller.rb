class SelectMoviesController < ApplicationController

  before_action :authenticate_user!

  def index
    @pelicula = Pelicula.find(params[:id])
  end
end

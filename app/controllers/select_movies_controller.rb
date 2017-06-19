class SelectMoviesController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @pelicula = Pelicula.find(params[:id])
  end
end

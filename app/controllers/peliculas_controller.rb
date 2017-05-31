class PeliculasController < ApplicationController
  def index
    @pelicula = Pelicula.all
  end

  def show
    @pelicula = Pelicula.find(params[:id])
  end

  def new
    @pelicula = Pelicula.new
  end

  def create
    @pelicula = Pelicula.new(peliculas_params)

    if @pelicula.save
      redirect_to peliculas_path, notice: "Se ha guardado la peli!!"
    else
      render :new
    end
  end

end

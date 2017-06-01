class AddImageToPelicula < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :image, :string
  end
end

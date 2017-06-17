class AddPrecioToPeliculas < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :precio, :integer
  end
end

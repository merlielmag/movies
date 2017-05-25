class AddColumnsToPelicula < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :name, :string
    add_column :peliculas, :stars, :integer
    add_column :peliculas, :main_actor, :string
    add_column :peliculas, :year, :integer
  end
end

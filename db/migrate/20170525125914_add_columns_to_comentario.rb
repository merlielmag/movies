class AddColumnsToComentario < ActiveRecord::Migration[5.0]
  def change
    add_column :comentarios, :pelicula_id, :integer
    add_column :comentarios, :user_id, :integer
    add_column :comentarios, :comentario, :text
  end
end

class Pelicula < ApplicationRecord
  belongs_to :language
  belongs_to :country
  belongs_to :genre
end

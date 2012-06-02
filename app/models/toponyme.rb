class Toponyme < ActiveRecord::Base
  belongs_to :enqueteur
  validates :toponyme_actuel, :presence => true
  validates :variante_graphique, :presence => true
end

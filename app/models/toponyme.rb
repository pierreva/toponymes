class Toponyme < ActiveRecord::Base
  belongs_to :enqueteur
  belongs_to :user
  validates :toponyme_actuel, :presence => true
  validates :variante_graphique, :presence => true
end

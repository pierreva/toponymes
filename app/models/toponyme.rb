class Toponyme < ActiveRecord::Base
  belongs_to :enqueteur
  belongs_to :user
  has_many :assets
  accepts_nested_attributes_for :assets
  #has_attached_file :asset
  validates :toponyme_actuel, :presence => true
  validates :variante_graphique, :presence => true
end

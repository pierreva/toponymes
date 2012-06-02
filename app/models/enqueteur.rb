class Enqueteur < ActiveRecord::Base
  has_many :toponymes
  validates :nom, :presence => true
end

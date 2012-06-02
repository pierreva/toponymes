class Enqueteur < ActiveRecord::Base
  has_many :toponymes, :dependent => :destroy
  validates :nom, :presence => true
end

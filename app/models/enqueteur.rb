class Enqueteur < ActiveRecord::Base
  validates :nom, :presence => true
end

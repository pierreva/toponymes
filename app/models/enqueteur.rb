class Enqueteur < ActiveRecord::Base
  has_many :toponymes, :dependent => :destroy
  validates :nom, :presence => true
  has_many :permissions, :as => :thing
  scope :readable_by, lambda { |user|
  joins(:permissions).where(:permissions => { :action => "view",
  :user_id => user.id })
  }
  def self.for(user)
  user.admin? ? Enqueteur : Enqueteur.readable_by(user)
  end
end

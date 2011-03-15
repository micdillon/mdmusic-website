class Project < ActiveRecord::Base
  has_many :releases, :dependent => :destroy

  validates_presence_of :name
end

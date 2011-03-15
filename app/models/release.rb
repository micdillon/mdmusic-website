class Release < ActiveRecord::Base
  belongs_to :project
  has_many :tracks, :dependent => :destroy
  has_many :buylinks, :dependent => :destroy

  validates_presence_of :name, :release_date
end

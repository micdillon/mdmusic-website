class Track < ActiveRecord::Base
  belongs_to :release

  validates_presence_of :name, :number
end

class VideoGroup < ActiveRecord::Base
  validates :name, :presence => true
  has_many  :videos
end

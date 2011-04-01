class AddClientToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :client, :string
  end

  def self.down
    remove_column :videos, :client
  end
end

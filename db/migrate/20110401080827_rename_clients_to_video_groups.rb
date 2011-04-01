class RenameClientsToVideoGroups < ActiveRecord::Migration
  def self.up
    rename_table :clients, :video_groups
  end

  def self.down
    rename_table :video_groups, :clients
  end
end

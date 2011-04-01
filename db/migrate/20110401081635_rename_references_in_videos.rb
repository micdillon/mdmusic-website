class RenameReferencesInVideos < ActiveRecord::Migration
  def self.up
    rename_column :videos, :client_id, :video_group_id
  end

  def self.down
    rename_column :videos, :video_group_id, :client_id
  end
end

class AddEmbedtextToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.text :embed_code
    end
  end

  def self.down
    remove_column :videos, :embed_code
  end
end

class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.text :description
      t.string :agency
      t.string :producer
      t.references :client

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end

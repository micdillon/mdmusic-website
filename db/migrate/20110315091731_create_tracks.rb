class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :name
      t.integer :number
      t.string :audio_url
      t.string :video_url
      t.references :release

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end

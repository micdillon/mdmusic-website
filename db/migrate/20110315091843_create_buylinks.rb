class CreateBuylinks < ActiveRecord::Migration
  def self.up
    create_table :buylinks do |t|
      t.string :name
      t.string :url
      t.references :release

      t.timestamps
    end
  end

  def self.down
    drop_table :buylinks
  end
end

class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.text :bio
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end

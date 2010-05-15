class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :entry_id
      t.string :name
      t.string :url
      t.timestamps
    end
  end
  
  def self.down
    drop_table :links
  end
end

class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :title
      t.string :supplicant
      t.integer :year
      t.string :language
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end


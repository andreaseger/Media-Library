class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.integer :year
      t.text :nfo
      t.string :media_typ
      t.string :quality
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end


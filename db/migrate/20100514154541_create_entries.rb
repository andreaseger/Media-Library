class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.integer :year
      t.text :nfo
      t.boolean :media_typ    # true->Movie | false->TV-Show
      t.string :quality
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end


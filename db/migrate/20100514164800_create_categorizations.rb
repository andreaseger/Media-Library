class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.integer :entry_id
      t.integer :genre_id
    end
  end

  def self.down
    drop_table :categorizations
  end
end


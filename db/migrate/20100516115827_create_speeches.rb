class CreateSpeeches < ActiveRecord::Migration
  def self.up
    create_table :speeches do |t|
      t.integer :entry_id
      t.integer :language_id
    end
  end

  def self.down
    drop_table :speeches
  end
end


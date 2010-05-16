class AddImageUrlToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :image_url, :string
  end

  def self.down
    remove_column :entries, :image_url
  end
end

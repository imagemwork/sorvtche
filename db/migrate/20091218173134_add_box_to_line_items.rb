class AddBoxToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :is_box, :boolean, :default => false
  end

  def self.down
    remove_column :is_box
  end
end

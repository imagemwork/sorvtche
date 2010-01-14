class AlterNameColumnLineItems2 < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :num, :box_quantity
  end

  def self.down
    rename_column :line_items, :box_quantity, :num
  end
end

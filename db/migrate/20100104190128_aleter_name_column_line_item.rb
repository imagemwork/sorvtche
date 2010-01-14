class AleterNameColumnLineItem < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :is_box, :box_quantity
  end
end

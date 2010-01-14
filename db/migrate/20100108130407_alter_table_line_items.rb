class AlterTableLineItems < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :quantity, :item_quantity
  end
end

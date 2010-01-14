class AlterNameColumnLineItems < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :box_quantity, :num
  end

  def self.down
    rename_column :line_itens, :num, :box_quantity
  end
end

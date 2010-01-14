class AleterTypeCollumnCartItem < ActiveRecord::Migration
  def self.up
    change_column :line_items, :is_box, :integer
  end

end

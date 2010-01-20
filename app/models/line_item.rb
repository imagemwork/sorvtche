class LineItem < ActiveRecord::Base
  
  belongs_to :order, :dependent => :destroy
  belongs_to :product
  
  def self.from_cart_item(cart_item)
    li = self.new
    li.product = cart_item.product
    li.item_quantity = cart_item.item_quantity
    li.box_quantity = cart_item.box_quantity
    li
  end

end

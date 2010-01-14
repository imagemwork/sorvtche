class StoreObserver < ActiveRecord::Observer
  def after_save_order
    Checkout.deliver_order_checkout
  end
end

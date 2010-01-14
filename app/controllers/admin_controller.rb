class AdminController < ApplicationController
  def index
    @orders = Order.all
  end
  


end

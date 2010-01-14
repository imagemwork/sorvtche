class BudgetsController < ApplicationController
  include AuthenticatedSystem  
   before_filter :authorized_admin?
  layout "private"
  
  def index
   @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @linesItems = @order.line_items.all
    
    respond_to do |format|
      format.html
      format.pdf { render :layout => false }
    end
  end
  
  private
  def authorized_admin?
    unless current_user and current_user.is_admin == true
      render :error_page
    end
  end
  
end



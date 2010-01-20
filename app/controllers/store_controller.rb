class StoreController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required
  layout "private"

  def index
      @products = Product.paginate :page => params[:page], :per_page => 2
      @cart = find_cart
  end
 
  def add_to_cart
    begin
      @product = Product.find(params[:id])
      quantidade = params[:quantidade]
      @quantidade = quantidade.to_i
    rescue ActiveRecord::RecordNotFound
      logger.error("Alguem tentando acessar algum produto que possivelmente nao existe: #{:id}")
      redirect_to(:controller => :store, :action => index)
      else
        @cart = find_cart
        @cart.add_product(@product, @quantidade)
        respond_to do |format|
        			format.js
        			format.html { redirect_to(:controller => "store", :action => "index") }
        end
      end
    end
  
  
  def add_to_cart_box
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Alguem tentando acessar algum produto que possivelmente nao existe: #{:id}")
      redirect_to(:controller => :store, :action => index)
    else
      @cart = find_cart
      @cart.add_product_box(@product, 1)
      respond_to do |format|
        format.js
        format.html { redirect_to(:controller => "store", :action => "index") }
      end
    end
  end
  
  def delete_all_products
     @cart = find_cart
     @product = Product.find(params[:id])
     #@quantidade_p = @cart.contar_p(@product)
     @cart.delete_all_products(@product)
     respond_to do |format|
      format.html{redirect_to(:controller => "store", :action => "details")} 
      format.js
     end
   end
  
  def remove_product
    @cart = find_cart
    product = Product.find(params[:id])
    unless @cart.remove_product(product)
      render :update do |page|
        page.alert("Ops, Você não tem nenhuma caixa na sua lista.")
      end
    else
    respond_to do |format|
      format.html{redirect_to(:controller => "store", :action => "index")} 
      format.js
    end
  end
  end
  
  def remove_item_action
    @cart = find_cart
    product = Product.find(params[:id])
    unless @cart.remove_item_action(product)
      render :update do |page|
        page.alert("Ops, Você não tem nenhum produto na sua lista.")
      end
    else
    respond_to do |format|
        format.html{redirect_to(:controller => "store", :action => "index")} 
        format.js
     end
   end
  end
 
  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to(products_path)
    else
      @order = Order.new
    end
  end
  
  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      user_name = current_user.name
      session[:cart] = nil
      flash[:notice] = "Obrigado pelo seu orçamento, retornaremos o mais breve possivel."
      Checkout.deliver_order_checkout(user_name)
      redirect_to(:controller => :orders, :action => :index)
    else
      render :action => :checkout
    end
  end
  
  def details
    @cart = find_cart
  end
  
  private
   def find_cart
     session[:cart] ||= Cart.new
   end

end
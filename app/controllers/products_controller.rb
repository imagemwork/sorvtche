class ProductsController < ApplicationController

  include AuthenticatedSystem  
  before_filter :authorized_admin?

  layout "private"

  def list
    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def edit
    @product = Product.find(params[:id])
  end


  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Produto cadastrado com sucesso.'
        format.html { redirect_to(:action => "list") }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @product = Product.find(params[:id])
     respond_to do |format|
        if @product.update_attributes(params[:product])
          flash["notice_#{@product.id}"] = 'Produto atualizado com sucesso.'
          format.html { redirect_to(:controller => "products", :action => "list") }
          format.js
        else
          format.html { render :action => "edit" }
          format.js
        end
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
     format.js
    end
  end
  
  def show_edit_product
    @product = Product.find(params[:id])
    respond_to do |page|
      page.js
    end
  end
  
  def close_box_edit
    @product = Product.find(params[:id])
    respond_to do |page|
      page.js
    end
  end
  
  private
  def authorized_admin?
    unless current_user and current_user.is_admin == true
      render :error_page
    end
  end
  
end
class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  include AuthenticatedSystem
  before_filter :login_required
  layout "private"
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @categories = Category.all
    @category = Category.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    @flag = false
    respond_to do |format|
      if @category.save
        flash[:noticeCategory] = 'Categoria criada com sucesso'
        format.html { redirect_to(new_category_path) }
        format.js
      else
        @flag = true
        flash[:categories] = "Você não pode deixar em branco"
        format.html { redirect_to(new_category_path) }
        format.js
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
        if @category.update_attributes(params[:category])
          format.html { redirect_to(@category) }
          format.json { render :json => @category }
        else
          format.html { render :action => "edit" }
        end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
    	format.js
    end
  end
end

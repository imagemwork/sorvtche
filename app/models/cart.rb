class Cart
  
  attr_reader :items, :quantidade_total, :type, :num, :quantidade
  
  def initialize
    @items = []
    @quantidade_total = 0
  end
    
  def add_product(product, quantidade)
      contar_itens(quantidade)
      get_current_item(product)
      if @current_item
        @current_item.increment(quantidade, "item")
      else 
        @items << CartItem.new(product, quantidade, "item")
    end
  end
  
  def add_product_box(product,quantity)
    contar_boxs(1)
    get_current_item(product)
    if @current_item
      @current_item.increment(1, "box")
    else
      @items << CartItem.new(product,0,"box")
    end
  end
  
  def contar_boxs(quantidade)
    add_total(1)
  end
  
  def remove_product(product)
    get_current_item(product)
    get_index_product
    unless @current_item == nil 
      if @current_item.box_quantity == 1 and @current_item.item_quantity == 0
        @items.delete_at(@index_of_product)
        diminue_total(1)
      end
      if @current_item.box_quantity >= 1 and @current_item.item_quantity >= 0
        @current_item.unincrement("box")
        diminue_total(1)
      end
    end
  end
  
  def remove_item_action(product)
    get_current_item(product)
    get_index_product
    unless @current_item == nil
      if @current_item.item_quantity == 1 and @current_item.box_quantity == 0
        @items.delete_at(@index_of_product)
        diminue_total(1)
      end
      if @current_item.item_quantity >= 1 
        quantidade_itens = @current_item.item_quantity
        quntidade_box = @current_item.box_quantity
        @current_item.unincrement("item")
        diminue_total(1)
      end
    end
  end
  
  def delete_all_products(product)
    product = @items.find {|item| item.product == product}
    descrementa = product.item_quantity + product.box_quantity
    puts "Quatnidade total = #{descrementa}"
    index_of_product = @items.index(product)
    @items.delete_at(index_of_product)
    diminue_total(descrementa)
  end
  
  def contar_itens(quantidade)
    add_total(quantidade)
  end
  
  def add_total(quantidade)
    @quantidade_total += quantidade
  end
  
  def diminue_total(quantidade)
    @quantidade_total -= quantidade
  end

  def contar_total
    if @quantidade_total < 0
      @quantidade_total = 0
    end
    @quantidade_total
  end
  
  private
  def zera_contar
    if @quantidade < 0
      @quantidade = 0
    end
  end
  
  def get_index_product
    @index_of_product = @items.index(@current_item)
  end
  
  def get_current_item(product)
     @current_item = @items.find {|item| item.product == product}
  end
  
  def unincrement_quantidade
    if @quantidade == 0
      @quantidade = 0
    else
      @quantidade -= 1
    end
  end
  
end
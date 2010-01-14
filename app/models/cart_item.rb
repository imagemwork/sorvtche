class CartItem
  
  attr_reader :product, :item_quantity, :is_box, :num, :type, :box_quantity
  
  def initialize(product, quantidade, type)
    @product = product
    @item_quantity = quantidade
    if type == "box"
      @box_quantity = 1
    else
      @box_quantity = 0
    end
    @type = type
  end
  
  def increment(quantidade, type)
    if type == "box"
      @box_quantity += quantidade
    end
    if type == "item"
      @item_quantity += quantidade
    end
  end
  
  def unincrement(type)
    if type == "box"
      @box_quantity -= 1
    end
    if type == "item"
      @item_quantity -= 1
      if @item_quantity < 0
        @item_quantity = 0
      end
    end
  end
  
  def zerar
    @quantity = 0
  end
  
  def name
    @product.name
  end
  
  def quantidade_itens
    @item_quantity 
  end
  
  def quantidade_caixas
    @box_quantity
  end
  
  def num_box
    "#{@box_quantity} (#{@box_quantity * 50})"
  end
  
  private 
  def add_num_box
    @box_quantity +=1
  end
  
end
pdf.image open("#{RAILS_ROOT}/public/images/logo.png")
pdf.move_down(30)  

pdf.text "Numero # #{@order.id}", :size =>  30, :style => :bold
pdf.text "Cliente: #{@order.user.name}"
pdf.text "Realizado em: #{data_bonita(@order.created_at)}"

pdf.move_down(30)  

items = @linesItems.map do |line|
	[
		line.product.name,
		line.item_quantity,
		line.box_quantity,
		line.item_quantity + line.box_quantity
	]
end


pdf.table items, :border_style => :grid,  
  :row_colors => ["FFFFFF", "DDDDDD"],  
  :headers => ["Produto", "Quantidade de Itens", "Quantidade Caixas"],  
  :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }


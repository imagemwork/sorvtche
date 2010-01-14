# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def link_voltar(nome)
    return link_to_function nome, 'history.back()', :class => "link-back"
  end
  

  def title_page(name)
  	content_for(:title) { "<span class='navigation'>#{name}</span>" }
  end
  
  def data_bonita(data)
		data.strftime("%d/%m/%Y")
	end
	
	def title(title, title2=nil)
		if title2
			"<h3><span class='titulos'>#{title}</span> #{title2}</h3>" 
		else
			"<h3><span class='titulos'>#{title}</span></h3>" 
			end
	end
	
end

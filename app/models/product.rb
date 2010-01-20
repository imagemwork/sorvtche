class Product < ActiveRecord::Base
  
  attr_accessor :new_category_name
  
  belongs_to :category
  has_many :line_items, :dependent => :destroy
  
  has_many :orders, :through => :line_items
  validates_presence_of :code, :name, :weight, :ingredients, :category_id
  validates_uniqueness_of :code

  has_attached_file :picture, :styles => { :thumb => ["110x110", :png] }
  #validates_attachment_content_type :picture, :content_type => 'image/jpg, image/png', :message => "Formato inválido, tipo de imagem deve ser, png ou jpeg"
  
end

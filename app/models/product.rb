class Product
  include Mongoid::Document
  field :product_name, :type => String
  field :views, :type => Integer
  field :added_date, :type => Time
  field :_id, type: String, default: ->{ product_name }
  embedded_in :subcategory, :inverse_of => :product
  embeds_many :reviews
end

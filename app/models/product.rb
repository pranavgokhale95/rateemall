class Product
  include Mongoid::Document
  field :product_id, :type => String #should be the subcategory name
  field :product_name, :type => String
  field :_id, type: String, default: ->{ product_name }
  embedded_in :subcategory, :inverse_of => :product
  embeds_many :reviews
end

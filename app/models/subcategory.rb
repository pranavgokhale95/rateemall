class Subcategory
  include Mongoid::Document
  field :subcategory_id, :type => Integer
  field :subcategory_name, :type => String
  field :_id, type: String, default: ->{ subcategory_name }
  embeds_many :products
  embedded_in :category, :inverse_of => :subcategory
end

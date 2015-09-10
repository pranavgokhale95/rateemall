class Subcategory
  include Mongoid::Document
  field :subcategory_name, :type => String
  field :last_modified, :type=>Time
  field :_id, type: String, default: ->{ subcategory_name }
  embeds_many :products
  embedded_in :category, :inverse_of => :subcategory
end

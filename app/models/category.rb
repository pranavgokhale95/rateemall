class Category
  include Mongoid::Document
  field :category_id, :type=>Integer
  field :category_name, :type=>String

  field :_id, type: String, default: ->{ category_name }
  embeds_many :subcategories

end

class Category
  include Mongoid::Document
  include Mongoid::Search
  
  #field :category_id, :type=>Integer
  field :category_name, :type=>String
  field :last_modified, :type=>Time
  validates_uniqueness_of :category_name, :allow_nil => false
  validates_presence_of :category_name
  field :_id, type: String, default: ->{ category_name }
  embeds_many :subcategories
  search_in :category_name
end
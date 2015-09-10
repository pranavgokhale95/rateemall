class Latest
  include Mongoid::Document
  field :count, :type => Integer, :default => -1
  field :l_products, :type => Array, :default => Array.new
end

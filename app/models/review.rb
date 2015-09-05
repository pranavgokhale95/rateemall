class Review
  include Mongoid::Document
  field :author
  field :product_name
  field :body
  embedded_in :product, :inverse_of => :review
end

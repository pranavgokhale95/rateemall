class Review
  include Mongoid::Document
  field :email, :type => String
  validates_uniqueness_of :email, :allow_nil => false
  field :product_name
  field :body, :type => String
  field :review_date, :type => Time
  field :sent_rating, :type => Float
  field :rating, :type => Float
  validates_presence_of :rating

  embedded_in :product, :inverse_of => :review
end

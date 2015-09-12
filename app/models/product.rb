class Product
  include Mongoid::Document
  include Mongoid::Paperclip
  field :product_name, :type => String
  field :views, :type => Integer, :default => 0
  field :added_date, :type => Time
  field :avg_rating, :type => Float, :default => -1
  has_mongoid_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  field :_id, type: String, default: ->{ product_name }
  embedded_in :subcategory, :inverse_of => :product
  embeds_many :reviews
end

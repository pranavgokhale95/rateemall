class Latest
	include Mongoid::Document

	field :count, :type => Integer, :default => 0
	embeds_many :latestproducts #, order: :added_date.desc
end

class Latestproduct
	include Mongoid::Document
	include Mongoid::Paperclip
	include Mongoid::Search
	
	field :product_name, :type => String
	field :added_date, :type =>Time
	has_mongoid_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	field :rating, :type => Float
	field :views, :type => Integer, :default => 0
	field :avg_rating, :type => Integer, :default => -1
	embedded_in :latest, :inverse_of => :latestproduct
	search_in :product_name
end
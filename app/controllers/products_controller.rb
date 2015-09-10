class ProductsController < ApplicationController
	def create
		Rails.logger.debug params.inspect
		@category = Category.where("subcategories._id"=>params[:subcategory_id]).one
		@subcategory=@category.subcategories.find(params[:subcategory_id])
		@product=@subcategory.products.new(post_params)

		@product.added_date = Time.now.utc.iso8601
		@subcategory.last_modified = Time.now.utc.iso8601
		@category.last_modified = Time.now.utc.iso8601


		@latest = Latest.all.one
		@curr = @latest.count
		@curr =(@curr +1)%3
		
		if(@latest.l_products)
			@latest.l_products.push(@product.product_name)		
		end

		@category.save
		@subcategory.save
		@product.save
		@latest.save
		redirect_to @subcategory
	end

	def new
	@product = Product.new
	end

	def post_params
	params.require(:product).permit(:product_id,:product_name)
	end

	def show
		Rails.logger.debug params.inspect
		@category = Category.where("subcategories.products._id"=>params[:id]).one
		@subcategory = @category.subcategories.where("products._id"=> params[:id]).one
		@product = Category.where("subcategories.products._id"=>params[:id]).one.subcategories.where("products._id"=> params[:id]).one.products.find(params[:id])
		
		if(@product.views)
			@product.views=@product.views+1
		else
			@product.views=1
		end

		
		@product.save
		#@subcategories = @category.subcategories.all
	end

	def index
	end
end

class ProductsController < ApplicationController
	def create
		Rails.logger.debug params.inspect
		@category = Category.where("subcategories._id"=>params[:subcategory_id]).one
		@subcategory=@category.subcategories.find(params[:subcategory_id])
		@product=@subcategory.products.create!(post_params)
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
		@product = Category.where("subcategories.products._id"=>params[:id]).one.subcategories.where("products._id"=> params[:id]).one.products.find(params[:id])
		#@subcategories = @category.subcategories.all
	end

	def index
	end
end

class SubcategoriesController < ApplicationController
	def create
	@category=Category.find(params[:category_id])
	@subcategory=@category.subcategories.create!(post_params)
	redirect_to @category
	end

	def show
		@category = Category.where("subcategories._id"=>params[:id]).one
		@subcategory = @category.subcategories.find(params[:id])
	end

	def post_params
		params.require(:subcategory).permit(:subcategory_id,:subcategory_name)
	end

	def addproduct
		#@category = Category.find(params[:category_id])
		#@subcategory = @category.subcategories.find(params[:subcategory])
	end

	def index

	end

end

class CategoriesController < ApplicationController
	def index
	@categories = Category.all
	end

	def show
	@category=Category.find(params[:id])
	end

	def new
	@category = Category.new
	end

	def create
	@category = Category.new(post_params)
	
	if(@category.save)
		redirect_to categories_path
	end

	end

	def addsubcategory
		@category=Category.find(params[:category_id])
	end

	def post_params
	params.require(:category).permit(:category_id,:category_name)
  	end

end
